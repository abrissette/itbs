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

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: {code: '123456', name: 'El Project'  }
    end

    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should render edit template when editing project" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { code: '123456', name: 'El Project' }
    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should not delete project when reference by worklog" do
    assert_difference('Project.count', 0) do
      delete :destroy, id: @project
    end

    assert_redirected_to admin_projects_path
  end

  test "Should delete project when not reference by any worklog" do
    project = Project.create(  code: '000000', name: 'UNUSED PROJECT')

    assert_difference('Project.count',-1) do
      delete :destroy, id: project
    end
  end

end
