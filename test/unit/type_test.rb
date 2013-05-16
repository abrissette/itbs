require 'test_helper'

class TypeTest < ActiveSupport::TestCase

  test "code should be exactly 4 character" do
     type = types(:requirement)
     type.code = "XYZ"

     assert type.invalid?
     assert type.errors[:code].any?
  end

  test "should not remove type when referenced by worklog" do
    worklog = worklogs(:requirement_on_ilove)
    type = worklog.type

    assert_difference('Type.count', 0) do
      type.destroy
    end
  end
end
