class SearchFacade
  def self.parks(state)
    parks = service.get_parks(state)[:data]
    parks.map { |park_info| park(park_info)}
  end

  def self.service
    ParkService.new
  end

  def self.park(park_info)
    Park.new(park_info)
  end
end
