class Timesheet < ActiveRecord::Base
  attr_accessible :end_date, :employee, :worklogs

  validates :end_date, :employee, :presence => true

  has_many :worklogs, dependent: :destroy

  belongs_to :employee
end