class Apartment
  attr_reader :number
  def initialize(info)
    @number = info[:number]
  end
end
