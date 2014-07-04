class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  protected

    def authorize
      unless Employee.find_by_id(session[:employee_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
