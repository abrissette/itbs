class SessionsController < ApplicationController

  skip_before_filter :authorize

  def new
  end

  def create
    employee = Employee.find_by_jira_username(params[:name])
    if employee and employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      redirect_to timesheets_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to login_url, notice: "Logged out"

  end
end
