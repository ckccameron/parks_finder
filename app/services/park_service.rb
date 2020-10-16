class ParkService
  def get_parks(state)
    response = conn.get("parks") do |req|
      req.params["api_key"] = ENV["NPS_API_KEY"]
      req.params["stateCode"] = state
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nps.gov/api/v1/")
  end
end
