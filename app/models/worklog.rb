class Worklog < ActiveRecord::Base
  attr_accessible :date, :description, :employee_name, :project_code, :type_code, :value

  validates :date, :employee_name, :project_code, :type_code, :presence => true

  validates :value, :numericality => { :only_integer => true, :greater_than_or_equal_to => 30 ,
            :message => "number of minutes must be greater or equal to 30" }

end
