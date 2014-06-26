require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  setup do
    @existing_employee = employees(:Andre)
  end

  test "cannot save with an existing jira_username" do

    a_new_employee = Employee.create( jira_username: 'new.employee@jestadigital.com',
                            tempo_staff_id: 'new.employee@jestadigital.com',
                            email: 'new.employee@jestadigital.com',
                            employee_number: 10000)

    a_new_employee.jira_username= @existing_employee.jira_username

    assert !a_new_employee.save
    assert a_new_employee.errors[:jira_username].any?
    assert_equal ["has already been taken"], a_new_employee.errors[:jira_username]
  end

    test "should not remove employee when referenced by timesheet" do
      timesheet = timesheets(:timesheet_for_andre_with_two_worklog)
      employee = timesheet.employee

      assert_difference('Employee.count', 0) do
        employee.destroy
      end
    end
end
