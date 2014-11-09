require 'test_helper'

class VoteOptionsControllerTest < ActionController::TestCase
  setup do
    @vote_option = vote_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_option" do
    assert_difference('VoteOption.count') do
      post :create, vote_option: { count: @vote_option.count, movie_id: @vote_option.movie_id, vote_id: @vote_option.vote_id }
    end

    assert_redirected_to vote_option_path(assigns(:vote_option))
  end

  test "should show vote_option" do
    get :show, id: @vote_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_option
    assert_response :success
  end

  test "should update vote_option" do
    patch :update, id: @vote_option, vote_option: { count: @vote_option.count, movie_id: @vote_option.movie_id, vote_id: @vote_option.vote_id }
    assert_redirected_to vote_option_path(assigns(:vote_option))
  end

  test "should destroy vote_option" do
    assert_difference('VoteOption.count', -1) do
      delete :destroy, id: @vote_option
    end

    assert_redirected_to vote_options_path
  end
end
