class GiffyService
  attr_reader :url

  def initialize(summary)
    @summary  = summary[0]
    @url      = get_gif_url
  end

  def get_gif_url
    all_data = get_gif_json
    all_data[:data][0][:url]
  end

private

  def get_gif_json
    @base_url = "http://api.giphy.com"
    extension = "/v1/gifs/search?q=#{@summary}&api_key=#{ENV["giffy_key"]}"
    response  = faraday_conn.get(extension)
    @parsed ||= JSON.parse(response.body, symbolize_names: true)
  end

  def faraday_conn
    Faraday.new(url: @base_url)
  end

end
