class TimesheetController < ApplicationController
  def index
    @timesheet = Timesheet.first
  end
end
