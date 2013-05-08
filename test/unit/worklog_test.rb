require 'test_helper'

class WorklogTest < ActiveSupport::TestCase
  test "mandatory attributes must be provided" do
    worklog = Worklog.new

    assert worklog.invalid?
    assert worklog.errors[:date].any?
    assert worklog.errors[:employee_name].any?
    assert worklog.errors[:project].any?
    assert worklog.errors[:type_code].any?
    assert worklog.errors[:value].any?
  end

  test "time logged must be at least 30 min" do
    worklog = worklogs(:worklog_on_ilove)
    worklog.value = 28

    assert worklog.invalid?
    assert worklog.errors[:value].any?
    assert_equal ["number of minutes must be greater or equal to 30"], worklog.errors[:value]
  end

  test "project should be valid" do

  end

  test "work type should be valid" do

  end

end
