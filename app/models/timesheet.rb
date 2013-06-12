class Timesheet < ActiveRecord::Base
  attr_accessible :end_date, :employee, :worklogs

  validates :end_date, :employee, :presence => true

  has_many :worklogs, dependent: :destroy
  accepts_nested_attributes_for :worklogs

  belongs_to :employee
end
