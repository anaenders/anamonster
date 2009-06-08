require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blogs" do
    assert_difference('Blogs.count') do
      post :create, :blogs => { }
    end

    assert_redirected_to blogs_path(assigns(:blogs))
  end

  test "should show blogs" do
    get :show, :id => blogs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => blogs(:one).id
    assert_response :success
  end

  test "should update blogs" do
    put :update, :id => blogs(:one).id, :blogs => { }
    assert_redirected_to blogs_path(assigns(:blogs))
  end

  test "should destroy blogs" do
    assert_difference('Blogs.count', -1) do
      delete :destroy, :id => blogs(:one).id
    end

    assert_redirected_to blogs_path
  end
end
