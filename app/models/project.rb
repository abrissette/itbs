class Project < ActiveRecord::Base
  attr_accessible :code, :name

  validates :code, :name, presence => true

  validates :code, length => 6
end
