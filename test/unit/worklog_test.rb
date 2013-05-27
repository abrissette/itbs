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

  context "when validating a worklog" do
    setup do
      @worklog = worklogs(:requirement_on_ilove_for_andre)
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

    context "when saving a worklog" do

        should "have date within timesheet period" do
          timesheet = timesheets(:timesheet_for_martin_without_worklog)
          timesheet.end_date = 2.days.ago
          @worklog.date = DateTime.now

          assert !@worklog.save
          assert @worklog.errors[:end_date].any?
          assert_equal ["worklog date is not in timesheet range"], @worklog.errors[:end_date]

        end
    end
  end


end
