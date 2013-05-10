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

  test "should not remove project when referenced by worklog" do
    worklog = worklogs(:requirement_on_ilove)
    project = worklog.project

    assert_difference('Project.count', 0) do
      project.destroy
    end
  end

end
