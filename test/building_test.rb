require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
  end

  def test_it_exists
    assert_instance_of Building, @building
  end
end
