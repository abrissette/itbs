require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  test "should not remove employee when referenced by timesheet" do
    timesheet = timesheets(:timesheet_for_andre_with_two_worklog)
    employee = timesheet.employee

    assert_difference('Employee.count', 0) do
      employee.destroy
    end
  end

end
