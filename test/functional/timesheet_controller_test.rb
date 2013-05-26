require 'test_helper'

class TimesheetControllerTest < ActionController::TestCase

  context "when showing a timesheet" do

    setup do
      @timesheet = timesheets(:timesheet_for_andre_with_two_worklog)
    end

    should "see all his worklogs within separate form to edit" do
      get :show, id: @timesheet
      assert_response :success
      assert_template :partial => 'worklogs/form', :count => 2
    end
  end
end
