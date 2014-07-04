require 'test_helper'

class Admin::EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:Martin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { email: 'ogie.oglethorpe@jestadigital.com', employee_number: '22500', jira_username: 'ogie.oglethorpe@jestadigital.com', tempo_staff_id: 'ogie.oglethorpe@jestadigital.com' }
    end

    assert_redirected_to admin_employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: { email: @employee.email, employee_number: @employee.employee_number, jira_username: @employee.jira_username, tempo_staff_id: @employee.tempo_staff_id }
    assert_redirected_to admin_employee_path(assigns(:employee))
  end

  test "should not delete employee when referenced by timesheet" do
    assert_difference('Employee.count', 0) do
      delete :destroy, id: @employee
    end

    assert_redirected_to admin_employees_path
  end

  test "should be able to delete employee when not referenced by timesheet" do
    paul = Employee.create( jira_username: 'paul.pot@jestadigital.com',
                            tempo_staff_id: 'paul.po@jestadigital.com',
                            email: 'paul.po@jestadigital.com',
                            employee_number: 77900)
    paul.is_admin= false

    assert_difference('Employee.count', -1) do
      delete :destroy, id: paul
    end

    assert_redirected_to admin_employees_path
  end

end
