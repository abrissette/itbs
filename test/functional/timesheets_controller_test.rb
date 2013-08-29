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

  test "should get new" do
    get :new

    assert false
  end

  test "should not allow timesheet creation" do
    assert_difference('Timesheet.count') do
      post :create, timesheet: {  }
    end

    assert false
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
    assert_difference('Timesheet.count', 0) do
      delete :destroy, id: @timesheet
    end

    assert_redirected_to timesheets_path
  end
end
