require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "code should be exactly 6 character" do
    project = projects(:ilove)
    project.code = "ABC"

    assert project.invalid?
    assert project.errors[:code].any?
  end

  test "should not be able to delete project reference by worklog" do
    worklog = worklogs(:worklog_on_motility)

  end

end
