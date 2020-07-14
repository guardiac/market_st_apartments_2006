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

  def test_it_has_units
    assert_equal [], @building.units
  end

  def test_it_can_add_units
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    @building.add_unit(unit1)

    assert_equal [unit1], @building.units
  end

  def test_it_has_renters
    assert_equal [], @building.renters
  end
end
