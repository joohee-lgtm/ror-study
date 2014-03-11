require 'test_helper'

class SongContentsControllerTest < ActionController::TestCase
  setup do
    @song_content = song_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_content" do
    assert_difference('SongContent.count') do
      post :create, song_content: { album: @song_content.album, content: @song_content.content, origin_url: @song_content.origin_url, singer: @song_content.singer, song: @song_content.song }
    end

    assert_redirected_to song_content_path(assigns(:song_content))
  end

  test "should show song_content" do
    get :show, id: @song_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_content
    assert_response :success
  end

  test "should update song_content" do
    patch :update, id: @song_content, song_content: { album: @song_content.album, content: @song_content.content, origin_url: @song_content.origin_url, singer: @song_content.singer, song: @song_content.song }
    assert_redirected_to song_content_path(assigns(:song_content))
  end

  test "should destroy song_content" do
    assert_difference('SongContent.count', -1) do
      delete :destroy, id: @song_content
    end

    assert_redirected_to song_contents_path
  end
end
