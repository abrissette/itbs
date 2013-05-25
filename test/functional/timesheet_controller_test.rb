require 'test_helper'

class TimesheetControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  context "when viewing a timesheet" do
    should "see all his worklogs within separate form to edit" do
      assert false
    end
  end
end
