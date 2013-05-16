class Employee < ActiveRecord::Base
  attr_accessible :employee_number, :jira_username, :tempo_staff_id

  validates :employee_number, :jira_username, :tempo_staff_id, :presence => true

  has_many :timesheets

  before_destroy :ensure_not_referenced_by_any_timesheet

  private

    def ensure_not_referenced_by_any_timesheet
        if timesheets.empty?
          return true
        else
          errors.add(:base, 'Referenced by timesheet')
          return false
        end
    end

end
