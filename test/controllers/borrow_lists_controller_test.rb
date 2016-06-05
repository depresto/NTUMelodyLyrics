require 'test_helper'

class BorrowListsControllerTest < ActionController::TestCase
  setup do
    @borrow_list = borrow_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:borrow_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create borrow_list" do
    assert_difference('BorrowList.count') do
      post :create, borrow_list: {  }
    end

    assert_redirected_to borrow_list_path(assigns(:borrow_list))
  end

  test "should show borrow_list" do
    get :show, id: @borrow_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @borrow_list
    assert_response :success
  end

  test "should update borrow_list" do
    patch :update, id: @borrow_list, borrow_list: {  }
    assert_redirected_to borrow_list_path(assigns(:borrow_list))
  end

  test "should destroy borrow_list" do
    assert_difference('BorrowList.count', -1) do
      delete :destroy, id: @borrow_list
    end

    assert_redirected_to borrow_lists_path
  end
end
