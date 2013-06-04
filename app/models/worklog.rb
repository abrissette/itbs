class Worklog < ActiveRecord::Base
  attr_accessible :date, :description, :value, :project, :type, :timesheet

  validates :date, :project_id, :type_id, :presence => true

  validates :value, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0.5 ,
            :message => "duration must be greater or equal to .5 hour" }

  belongs_to :project
  belongs_to :type
  belongs_to :timesheet

  before_save :ensure_date_is_in_timesheet_period

  private

    def ensure_date_is_in_timesheet_period
      if !timesheet.nil?

        if  (date <= timesheet.end_date and date > timesheet.end_date - 7)
          return true
        else
          errors.add(:end_date, 'worklog date is not in timesheet range')
          return false
        end
      end
    end
end
