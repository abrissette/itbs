require 'test_helper'

class TbsImporterTest < ActiveSupport::TestCase

  context "when exporting timesheet to a tbs file" do
    should "serialize worklogs within line with fields correctly position" do

      worklogs = [worklogs(:unit_testing_on_motility_for_andre)]

      tbsfile << worklogs

      expected_line = "219502013050100.512345600725010info on this log                   "

      assert_equal expected_line, tbsfile.read
    end
  end
end