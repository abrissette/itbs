require 'test_helper'

class Admin::ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:ilove)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_project" do
    assert_difference('Project.count') do
      post :create, project: {code: '123456', name: 'El Project'  }
    end

    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should show admin_project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update admin_project" do
    put :update, id: @project, project: { code: '123456', name: 'El Project' }
    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should destroy admin_project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to admin_projects_path
  end
end
