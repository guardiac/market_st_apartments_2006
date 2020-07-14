class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms
              
  def initialize(info)
    @number = info[:number]
    @monthly_rent = info[:monthly_rent]
    @bathrooms = info[:bathrooms]
    @bedrooms = info[:bedrooms]
  end
end
