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
      return [{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}},{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}}]

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

  class VideoPageGenerator < Generator
    include YoutubeData
    safe true

    def generate(site)
      videos = videos('UCkv-J_D8jK2N02nBcyM92mQ')

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
        basename = ((start / 8)+1).to_s
      end
    end
  end

  class PaginatedVideoPage < Page
    def initialize(site, dir, basename, total_pages, videos_list)
      @site = site
      @base = site.source
      @dir  = dir

      @basename = basename
      @ext      = '.html'
      @name     = @basename + @ext

      page_num = basename == 'videos' ? 1 : Integer(basename)
      page_description = basename == 'videos' ? '' : ' — Page ' + basename.to_s

      @data = {
        'layout' => 'videos',
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
