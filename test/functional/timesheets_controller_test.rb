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

  test "should not be able to access form to manually create timesheet" do
    assert_raise ActionController::RoutingError do
      get :new
    end
  end

  test "should not allow timesheet creation from UI" do
    assert_raise ActionController::RoutingError do
      post :create, timesheet: {  }
    end
  end

  test "should show a timesheet in view mode" do
    get :show, id: @timesheet
    assert_response :success
  end

  test "should get a timesheet for edit" do
    get :edit, id: @timesheet
    assert_response :success
  end

  test "should update a timesheet" do
    put :update, id: @timesheet, timesheet: {  }
    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

end
