require 'uri'
require 'json'
require 'jekyll'
require 'dotenv'
require 'net/http'

module Jekyll
  module YoutubeData
    def params(hash = {})
      Dotenv.load

      {
        :key => ENV['YOUTUBE_API_KEY'],
        :channelId => 'UCkv-J_D8jK2N02nBcyM92mQ'
      }.merge(hash)
    end

    def videos_endpoint(page_token = '')
      uri = URI('https://www.googleapis.com/youtube/v3/search')

      uri.query = URI.encode_www_form(params({
        order: 'date',
        maxResults: 2,
        part: 'id,snippet',
        pageToken: page_token
      }))

      uri
    end

    def videos(input)

      return [{"title"=>"Google Associate Android Developer Certification || My journey of becoming AAD || Exam Review", "date"=>"2022-05-12T160500Z", "description"=>"I became one of the 400 Google Associate Android Developers worldwide and here's everything about it! #google #android ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/tuYFw6f340Y/mqdefault.jpg", "width"=>480, "height"=>360}}, {"title"=>"Compiling and Installing ARM64 native OBS Studio on M1 MAC (Apple Silicon) | M1 Max/Pro/Air", "date"=>"2022-05-09T092111Z", "description"=>"Pre-requisites - Use the arm64 terminal. - Have brew installed in /opt/homebrew prefix. Run these commands in sequence to ...", "thumbnail"=>{"url"=>"https://i.ytimg.com/vi/MD_K4ihR3XI/mqdefault.jpg", "width"=>480, "height"=>360}}]

      res = Net::HTTP.get_response(videos_endpoint(''))
      return input if !res.is_a?(Net::HTTPSuccess)

      json = JSON.parse(res.body)
      videos = []

      for item in json['items'] do
        if item['id']['kind'] == 'youtube#video'

          videos.push({
            'title': item['snippet']['title'],
            'date': item['snippet']['publishedAt'],
            'description': item['snippet']['description'],
            'thumbnail': item['snippet']['thumbnails']['medium']
          })

        end
      end

      nextPageToken = json['nextPageToken']

      while !nextPageToken.nil? and !nextPageToken.empty?
        res = Net::HTTP.get_response(videos_endpoint(nextPageToken))
        break if !res.is_a?(Net::HTTPSuccess)

        json = JSON.parse(res.body)
        nextPageToken = json['nextPageToken']

        for item in json['items'] do
          if item['id']['kind'] == 'youtube#video'

            videos.push({
              'title': item['snippet']['title'],
              'date': item['snippet']['publishedAt'],
              'description': item['snippet']['description'],
              'thumbnail': item['snippet']['thumbnails']['medium']
            })

          end
        end
      end

      puts videos

      videos
    end
  end
end

Liquid::Template.register_filter(Jekyll::YoutubeData)
