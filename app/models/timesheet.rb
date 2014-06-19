class Timesheet < ActiveRecord::Base
  attr_accessible :end_date, :employee, :worklogs_attributes

  has_many :worklogs, :dependent => :destroy
  belongs_to :employee

  validates :end_date, :employee, :presence => true
  validates_associated :worklogs

  accepts_nested_attributes_for :worklogs, :allow_destroy => true

end
