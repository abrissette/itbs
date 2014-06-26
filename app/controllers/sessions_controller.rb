class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.find_all_by_jira_username(:jira_username)
    if employee and employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to home_url, notice: "Logged out"

  end
end
