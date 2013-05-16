require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase

  context "when creating," do
    should "provide mandatory field" do
      timesheet = Timesheet.new

      assert timesheet.invalid?
      assert timesheet.errors[:employee].any?
      assert timesheet.errors[:end_date].any?
    end
  end

  context "when deleting," do
    should "destroy related worklogs" do
        timesheet = timesheets(:timesheet_for_andre_with_two_worklog)

        assert_difference('Worklog.count', -2) do
          timesheet.destroy
        end

    end
  end
end
