require 'test_helper'

class WorklogTest < ActiveSupport::TestCase
  test "mandatory attributes must be provided" do
    worklog = Worklog.new

    assert worklog.invalid?
    assert worklog.errors[:date].any?
    assert worklog.errors[:project].any?
    assert worklog.errors[:type].any?
    assert worklog.errors[:value].any?
  end

  test "time logged must be at least 30 min" do
    worklog = worklogs(:requirement_on_ilove)
    worklog.value = 28

    assert worklog.invalid?
    assert worklog.errors[:value].any?
    assert_equal ["number of minutes must be greater or equal to 30"], worklog.errors[:value]
  end

  test "project should be valid" do
    worklog = worklogs(:requirement_on_ilove)
    worklog.project = nil

    assert worklog.invalid?
    assert worklog.errors[:project].any?
  end

  test "work type should be valid" do
    worklog = worklogs(:requirement_on_ilove)
    worklog.type = nil

    assert worklog.invalid?
    assert worklog.errors[:type].any?
  end

end
