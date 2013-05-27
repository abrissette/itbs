require 'test_helper'

class WorklogsControllerTest < ActionController::TestCase
  setup do
    @worklog = worklogs(:requirement_on_ilove)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worklogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worklog" do
    assert_difference('Worklog.count') do
      post :create, worklog: {date: '2013/02/16', project_id: 1, type_id: 1, value: 1  }
    end

    assert_redirected_to worklog_path(assigns(:worklog))
  end

  test "should show worklog" do
    get :show, id: @worklog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worklog
    assert_response :success
  end

  test "should update worklog" do
    put :update, id: @worklog, worklog: { date: '2013/02/16', project_id: 1, type_id: 1, value:1  }
    assert_redirected_to worklog_path(assigns(:worklog))
  end

  test "should destroy worklog" do
    assert_difference('Worklog.count', -1) do
      delete :destroy, id: @worklog
    end

    assert_redirected_to worklogs_path
  end
end
