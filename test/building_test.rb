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

  def test_it_has_no_renters_if_units_empty
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    @building.add_unit(unit1)

    assert_equal [], @building.renters
  end

  def test_it_has_renters_if_units_occupied
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Aurora")

    unit1.add_renter(renter1)
    @building.add_unit(unit1)

    assert_equal ["Aurora"], @building.renters

    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    renter2 = Renter.new("Tim")

    unit2.add_renter(renter2)
    @building.add_unit(unit2)

    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_it_knows_average_rent
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)
    @building.add_unit(unit1)

    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)
    @building.add_unit(unit2)

    assert_equal 1099.5, @building.average_rent
  end
end
