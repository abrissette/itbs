require 'test_helper'
require 'worklog'

class TypesControllerTest < ActionController::TestCase
  setup do
    @type = types(:requirements)
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

    assert_redirected_to type_path(assigns(:type))
  end

  test "should show type" do
    get :show, id: @type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type
    assert_response :success
  end

  test "should update type" do
    put :update, id: @type, type: { code: @type.code, name: @type.name }
    assert_redirected_to type_path(assigns(:type))
  end

  test "should not destroy type when referenced by worklog" do
    assert_difference('Type.count', 0) do
      delete :destroy, id: @type
    end

    assert_redirected_to types_path
  end

  test "should destroy type when not referenced by any worklog" do
    @type =  Type.create(code: '0000', name: 'UNUSED TYPE')
    worklog = worklogs(:requirement_on_ilove_for_andre)
    worklog.type = @type

    assert_difference('Type.count', -1) do
      delete :destroy, id: @type
    end

    assert_redirected_to types_path
  end
end
