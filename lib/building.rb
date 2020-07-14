class Building
  attr_reader :units,
              :renters

  def initialize
    @units = []
    @renters = []
  end
end
