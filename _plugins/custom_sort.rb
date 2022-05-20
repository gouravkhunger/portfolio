# Custom plugin to sorts the hash for data/articles.yml based on the date.
# Returns articles sorted in reverse order.

module Jekyll
  module CustomSort
    def custom_sort(content)
      return content.sort_by { |key, value| value['date'] }.to_a.reverse.to_h
    end
  end
end

Liquid::Template.register_filter(Jekyll::CustomSort)