class BingService

  def initialize(address)
    @address = address
  end

  def coords
    formatted_address = @address.split(",")
    locality = formatted_address[0]
    district = formatted_address[1]
    incoming = get_coords_json(locality, district)
    incoming[:resourceSets][0][:resources][0][:point][:coordinates]
  end

  def get_coords_json(locality, district)
    @response ||= Faraday.get("http://dev.virtualearth.net/REST/v1/Locations?locality=#{locality}&adminDistrict=#{district}&countryRegion=United States&key=#{ENV["bing_key"]}")
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

end
