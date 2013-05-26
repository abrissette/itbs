class TimesheetController < ApplicationController
  def show
    @timesheet = Timesheet.first
  end
end
