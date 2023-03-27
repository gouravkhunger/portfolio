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
        'maxResults' => 2,
        'part' => 'id,snippet',
        'channelId' => channel_id,
        'pageToken' => page_token
      }))

      uri
    end

    def get_videos(input)
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
            'thumbnail' => item['snippet']['thumbnails']['medium']
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
              'description' => item['snippet']['description'],
              'thumbnail' => item['snippet']['thumbnails']['medium']
            })
          end
        end
      end

      videos
    end

    def videos(input)
      videos_cache.getset(input) do
        get_videos(input)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::YoutubeData)
