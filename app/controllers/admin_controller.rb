class AdminController < ApplicationController
  def index
    @total_timesheets = Timesheet.count
  end
end
