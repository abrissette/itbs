require 'test_helper'

class TimesheetControllerTest < ActionController::TestCase

  context "when showing a timesheet" do

    setup do
      # actual version of controller initiate @timesheet with first one
    end

    should "see all his worklogs within separate form to edit" do
      get :show
      assert_response :success
      assert_template :partial => 'shared/_worklog', :count => 2

    end

    should "see an additional form at bottom in order to add a new one" do
      get :show
      assert_response :success
      assert false

    end
  end

end
