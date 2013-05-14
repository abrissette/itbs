class Employee < ActiveRecord::Base
  attr_accessible :employee_number, :jira_username, :tempo_staff_id

  validates :employee_number, :jira_username, :tempo_staff_id, :presence => true

  has_many :worklogs

  before_destroy :ensure_not_referenced_by_any_worklog

  private

    def ensure_not_referenced_by_any_worklog
        if worklogs.empty?
          return true
        else
          errors.add(:base, 'Referenced by worklogs')
          return false
        end
    end

end
