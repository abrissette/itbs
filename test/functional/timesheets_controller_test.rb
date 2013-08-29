require 'test_helper'

class TimesheetsControllerTest < ActionController::TestCase
  setup do
    @timesheet = timesheets(:timesheet_for_andre_with_two_worklog)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheets)
  end

  test "should not get new" do
    assert_raise AbstractController::ActionNotFound do
      get :new
    end
  end

  test "should not allow timesheet creation" do
    assert_raise AbstractController::ActionNotFound do
      post :create, timesheet: {  }
    end
  end

  test "should show timesheet" do
    get :show, id: @timesheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timesheet
    assert_response :success
  end

  test "should update timesheet" do
    put :update, id: @timesheet, timesheet: {  }
    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should not allow destroy timesheet" do
    assert_raise AbstractController::ActionNotFound do
      delete :destroy, id: @timesheet
    end
  end
end
