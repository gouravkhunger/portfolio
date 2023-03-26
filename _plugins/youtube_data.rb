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
        maxResults: 50,
        part: 'snippet',
        pageToken: page_token
      }))

      uri
    end

    def videos(input)
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
            'thumbnail': item['snippet']['thumbnails']['high']
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
              'thumbnail': item['snippet']['thumbnails']['high']
            })

          end
        end
      end

      videos
    end
  end
end

Liquid::Template.register_filter(Jekyll::YoutubeData)
