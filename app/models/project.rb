class Project < ActiveRecord::Base
  attr_accessible :code, :name

  validates :code, :name, :presence => true

  validates :code, :length => {:is=>6}
end
