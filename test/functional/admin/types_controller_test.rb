require 'test_helper'
require 'worklog'

class Admin::TypesControllerTest < ActionController::TestCase
  setup do
    @type = types(:requirement)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type" do
    assert_difference('Type.count') do
      post :create, type: { code: @type.code, name: @type.name }
    end

    assert_redirected_to admin_type_path(assigns(:type))
  end

  test "should show type" do
    get :show, id: @type
    assert_response :success
  end

  test "should render edit template when editing type" do
    get :edit, id: @type
    assert_response :success
    assert_template "edit"
  end

  test "should update type" do
    put :update, id: @type, type: { code: @type.code, name: @type.name }
    assert_redirected_to admin_type_path(assigns(:type))
  end

  test "should not delete type when referenced by worklog" do
    assert_difference('Type.count', 0) do
      delete :destroy, id: @type
    end

    assert_redirected_to admin_types_path
  end

  test "Should be able to delete type when not referenced by any worklog" do
    type =  Type.create(code: '0000', name: 'UNUSED TYPE')

    assert_difference('Type.count', -1) do
      delete :destroy, id: type
    end

    assert_redirected_to admin_types_path
  end
end
