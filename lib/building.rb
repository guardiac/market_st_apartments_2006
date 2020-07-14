class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map do |unit|
      unit.renter.name if unit.renter
    end.compact
  end

  def average_rent
    ((@units.sum { |unit| unit.monthly_rent }) / @units.length.to_f).round(1)
  end

  def rented_units
    @units.find_all do |unit|
      unit.renter
    end
  end

  def renter_with_highest_rent
    rented_units.max_by do |unit|
      unit.monthly_rent
    end.renter
  end
end
