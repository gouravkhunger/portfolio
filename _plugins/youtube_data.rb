require 'uri'
require 'json'
require 'jekyll'
require 'dotenv'
require 'net/http'

module Jekyll
  module YoutubeData
    def params(hash = {})
      Dotenv.load
      { 'key' => ENV['YOUTUBE_API_KEY'] }.merge(hash)
    end

    def videos_cache
      @@videos_cache ||= Jekyll::Cache.new("YoutubeData::Videos")
    end

    def videos_endpoint(channel_id = "UCkv-J_D8jK2N02nBcyM92mQ", page_token = '')
      uri = URI('https://www.googleapis.com/youtube/v3/search')

      uri.query = URI.encode_www_form(params({
        'order' => 'date',
        'maxResults' => 50,
        'part' => 'id,snippet',
        'channelId' => channel_id,
        'pageToken' => page_token
      }))

      uri
    end

    def get_thumbnail(video_id)
      mqdefault = "mqdefault.webp"
      maxresdefault = "maxresdefault.webp"
      baseurl = "https://i.ytimg.com/vi_webp/#{video_id}/"

      uri = URI("#{baseurl}#{maxresdefault}")
      res = Net::HTTP.start(uri.hostname).head(uri.path)

      return res.is_a?(Net::HTTPOK) ? "#{baseurl}#{maxresdefault}" : "#{baseurl}#{mqdefault}"
    end

    def fetch_videos(input)
      res = Net::HTTP.get_response(videos_endpoint(channel_id = input))
      return input if !res.is_a?(Net::HTTPSuccess)

      json = JSON.parse(res.body)
      videos = []

      for item in json['items'] do
        if item['id']['kind'] == 'youtube#video'
          videos.push({
            'id' => item['id']['videoId'],
            'title' => item['snippet']['title'],
            'date' => item['snippet']['publishedAt'],
            'description' => item['snippet']['description'],
            'thumbnail' => get_thumbnail(item['id']['videoId'])
          })
        end
      end

      nextPageToken = json['nextPageToken']

      while !nextPageToken.nil? and !nextPageToken.empty?
        res = Net::HTTP.get_response(videos_endpoint(
          channel_id = input,
          page_token = nextPageToken
        ))

        break if !res.is_a?(Net::HTTPSuccess)

        json = JSON.parse(res.body)
        nextPageToken = json['nextPageToken']

        for item in json['items'] do
          if item['id']['kind'] == 'youtube#video'
            videos.push({
              'id' => item['id']['videoId'],
              'title' => item['snippet']['title'],
              'date' => item['snippet']['publishedAt'],
              'description' => item['snippet']['description']
            })
          end
        end
      end

      videos
    end

    def videos_list(input)
      videos_cache.getset(input) do
        fetch_videos(input)
      end
    end
  end

  class VideoPageGenerator < Generator
    safe true
    include YoutubeData

    def generate(site)
      videos = videos_list('UCkv-J_D8jK2N02nBcyM92mQ')

      total_pages = (videos.size / 8) + ((videos.size % 8) != 0 ? 1 : 0)

      start = 0
      stop = 7

      dir = ""
      basename = "videos"

      while videos[start..stop] != nil
        site.pages << PaginatedVideoPage.new(
          site,
          dir,
          basename,
          total_pages,
          videos[start..stop]
        )

        stop += 8
        start += 8

        dir = "videos/page"
        basename = ((start / 8) + 1).to_s
      end
    end
  end

  class PaginatedVideoPage < Page
    def initialize(site, dir, basename, total_pages, videos_list)
      @site = site
      @dir  = dir
      @base = site.source

      @basename = basename
      @ext      = '.html'
      @name     = @basename + @ext

      page_num = basename == 'videos' ? 1 : Integer(basename)
      page_description = basename == 'videos' ? '' : ' — Page ' + basename.to_s

      @data = {
        'layout' => 'videos',
        'video_embed' => true,
        'videos' => videos_list,
        'page_number' => page_num,
        'total_pages' => total_pages,
        'title' => "Videos by Gourav Khunger#{page_description} | Software Developer",
        'description' => "A collection of all the youtube videos posted by Gourav Khunger#{page_description}"
      }
    end

    def url_placeholders
      {
        :path       => @dir,
        :basename   => basename,
        :output_ext => output_ext,
      }
    end
  end
end
