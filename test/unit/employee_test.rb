require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  test "should not remove type when referenced by worklog" do
    worklog = worklogs(:requirement_on_ilove_for_andre)
    employee = worklog.employee

    assert_difference('Employee.count', 0) do
      employee.destroy
    end
  end

end
