require 'test_helper'

class DaumAlbumsControllerTest < ActionController::TestCase
  setup do
    @daum_album = daum_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daum_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daum_album" do
    assert_difference('DaumAlbum.count') do
      post :create, daum_album: { artist: @daum_album.artist, image_name: @daum_album.image_name, review: @daum_album.review, review_writer: @daum_album.review_writer, title: @daum_album.title }
    end

    assert_redirected_to daum_album_path(assigns(:daum_album))
  end

  test "should show daum_album" do
    get :show, id: @daum_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daum_album
    assert_response :success
  end

  test "should update daum_album" do
    patch :update, id: @daum_album, daum_album: { artist: @daum_album.artist, image_name: @daum_album.image_name, review: @daum_album.review, review_writer: @daum_album.review_writer, title: @daum_album.title }
    assert_redirected_to daum_album_path(assigns(:daum_album))
  end

  test "should destroy daum_album" do
    assert_difference('DaumAlbum.count', -1) do
      delete :destroy, id: @daum_album
    end

    assert_redirected_to daum_albums_path
  end

  test "crawl로 들어가는지 확인" do
    get :crawl
    assert_response :success
  end
end
