module Crawler
  extend ActiveSupport::Concern

  def crawl_from(url) # url(string) -> html_source(string)
    require 'open-uri'
    require 'nokogiri'
    Nokogiri::HTML(open(url)) # return
  end
end
