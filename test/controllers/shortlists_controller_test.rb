require 'test_helper'

class ShortlistsControllerTest < ActionController::TestCase
  setup do
    @shortlist = shortlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shortlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shortlist" do
    assert_difference('Shortlist.count') do
      post :create, shortlist: { course_id: @shortlist.course_id, user_id: @shortlist.user_id }
    end

    assert_redirected_to shortlist_path(assigns(:shortlist))
  end

  test "should show shortlist" do
    get :show, id: @shortlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shortlist
    assert_response :success
  end

  test "should update shortlist" do
    patch :update, id: @shortlist, shortlist: { course_id: @shortlist.course_id, user_id: @shortlist.user_id }
    assert_redirected_to shortlist_path(assigns(:shortlist))
  end

  test "should destroy shortlist" do
    assert_difference('Shortlist.count', -1) do
      delete :destroy, id: @shortlist
    end

    assert_redirected_to shortlists_path
  end
end
