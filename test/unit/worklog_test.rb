require 'test_helper'

class WorklogTest < ActiveSupport::TestCase

  context "when creating a worklog" do
    should "provide all mandatory attributes" do
      worklog = Worklog.new

      assert worklog.invalid?
      assert worklog.errors[:date].any?
      assert worklog.errors[:project_id].any?
      assert worklog.errors[:type_id].any?
      assert worklog.errors[:value].any?
    end

  end

  context "when validating a worklog " do
    setup do
      @worklog = worklogs(:requirement_on_ilove)
    end

    should "have a duration of half an hour" do
      @worklog.value = 0.4

      assert @worklog.invalid?
      assert @worklog.errors[:value].any?
      assert_equal ["duration must be greater or equal to .5 hour"], @worklog.errors[:value]
    end

    should "provide a valid project" do
      @worklog.project = nil

      assert @worklog.invalid?
      assert @worklog.errors[:project_id].any?

    end

    should "provide a valid work type" do
      @worklog.type = nil

      assert @worklog.invalid?
      assert @worklog.errors[:type_id].any?
    end

    context "and saving a worklog assigned to a timesheet " do

      setup do
        @worklog = worklogs(:requirement_on_ilove_for_andre)
      end

      should "accept worklog date on last day of timesheet period" do
        @worklog.timesheet.end_date = DateTime.now
        @worklog.date = @worklog.timesheet.end_date

        assert @worklog.save
      end

      should "not set worklog date outside timesheet period" do
        @worklog.timesheet.end_date = 2.days.ago
        @worklog.date = DateTime.now

        assert !@worklog.save
        assert @worklog.errors[:end_date].any?
        assert_equal ["worklog date is not in timesheet range"], @worklog.errors[:end_date]
      end

    end

    context "when exporting to tbs file" do
      should "serialize worklog in a fixpos format line" do

        expected_line = "219502013050102.012345600713010info on this log                   "

        @worklog = worklogs(:requirement_on_ilove_for_andre)

        worklog_line = @worklog.to_fixpos

        assert_equal expected_line, worklog_line
      end
  end

  end


end
