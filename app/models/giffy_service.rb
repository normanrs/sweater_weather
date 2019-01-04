class GiffyService

  def initialize(summary)
    @url = get_gif_url(summary)
  end

  def get_gif_url(text)
    get_url_json(text)
  end

  def get_url_json(text)
    @response ||= Faraday.get("https://api.darksky.net/forecast/#{ENV["darksky_key"]}/#{latitude},#{longitutde}")
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

end
