class GiffyService
  attr_reader :url

  def initialize(summary)
    @url = get_gif_url(summary)
  end

  def get_gif_url(text)
    all_data = get_json(text)
    all_data[:data][0][:url]
  end

  def get_json(text)
    cleaned = text.downcase.gsub(/[^a-z0-9\s]/i, '')
    response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{cleaned}&api_key=#{ENV["giffy_key"]}")
    @get_json ||= JSON.parse(response.body, symbolize_names: true)
  end

end
