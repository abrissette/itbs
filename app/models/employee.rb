class Employee < ActiveRecord::Base
  attr_accessible :employee_number, :jira_username, :tempo_staff_id, :email, :password, :password_comfirmation

  validates :employee_number, :tempo_staff_id, :presence => true

  validates :jira_username, :presence => true, :uniqueness => true

  has_many :timesheets

  has_secure_password

  before_destroy :ensure_not_referenced_by_any_timesheet

  private

    def ensure_not_referenced_by_any_timesheet
        if timesheets.empty?
          return true
        else
          errors.add(:base, 'This employee is still linked to a timesheet')
          return false
        end
    end

end
