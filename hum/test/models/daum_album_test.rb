require 'test_helper'

class DaumAlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "HTML요소 테스트" do
    require 'open-uri'
    require 'nokogiri'

    url = "http://music.daum.net/imagene/detail?award_id=381"
    source = Nokogiri::HTML(open(url))

    #puts source
    albums = source.css('.wrap_album')
    assert_equal(albums[0].css('.tit_album a')[0]['title'], "Psychemoon")

    #albums.each do |album|
    #  title = album.css('.tit_album a')[0]['title'] //a가 여러개
    #  image_name = album.css('.box_album a img')[0]['src']
    #  review_writer = album.css('.cont_review .tit').text
    #  review = album.css('.cont_review .desc p').text
    #
    #  parsed_album = {title: title,
    #                  image_name: image_name,
    #                  review_writer: review_writer,
    #                  review: review};
    #end
  end
end
