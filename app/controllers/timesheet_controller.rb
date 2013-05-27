class TimesheetController < ApplicationController

  # GET /timesheet
  # GET /timesheet.json
  def show
    @timesheet = Timesheet.first

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @timesheet }
     end
  end
end
