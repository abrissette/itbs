class Project < ActiveRecord::Base
  attr_accessible :code, :name

  validates :code, :name, :presence => true

  validates :code, :length => {:is=>6}

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
