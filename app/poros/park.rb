class Park
  attr_reader :id,
              :name,
              :description,
              :directions,
              :standard_hours
  def initialize(park_info)
    @id = park_info[:id]
    @name = park_info[:fullName]
    @description = park_info[:description]
    @directions = park_info[:directionsInfo]
    @standard_hours = park_info[:operatingHours][0][:standardHours]
  end
end
