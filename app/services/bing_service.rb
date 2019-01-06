class BingService

  def initialize(address)
    @address = address
  end

  def coords
    formatted_address = @address.split(",")
    @locality = formatted_address[0]
    @district = formatted_address[1]
    incoming = get_coords_json
    incoming[:resourceSets][0][:resources][0][:point][:coordinates]
  end

  def get_coords_json
    url = "/REST/v1/Locations"
    response = conn.get(url)
    @parsed ||= JSON.parse(response.body, symbolize_names: true)
  end

end

	def conn
		Faraday.new(url: "http://dev.virtualearth.net") do |faraday|
      faraday.params['locality'] = @locality
      faraday.params['adminDistrict'] = @district
      faraday.params['key'] = ENV["bing_key"]
			faraday.adapter Faraday.default_adapter
		end

	end
