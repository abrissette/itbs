class TimesheetController < ApplicationController
  def index
    @worklogs = Worklog.order(:date)
  end
end
