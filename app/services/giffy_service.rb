class GiffyService
 attr_reader :url

 def initialize(summary)
  @url = get_gif_url(summary)
 end

 def get_gif_url(text)
  all_data = get_json(text)
  all_data[:data][0][:embed_url]
 end

 def get_json(text)
  cleaned = clean_text(text)
  response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{cleaned}&api_key=#{ENV["giffy_key"]}")
  @get_json ||= JSON.parse(response.body, symbolize_names: true)
 end

 def clean_text(text)
  words = text.downcase.split(/\W+/)
  keywords = ["autumn", "blast", "blizzard", "bolt", "breeze", "brisk", "calm", "chill", "chilly", "clear", "cloud", "cloudy", "cold", "cool", "dawn", "daylight", "deluge", "dense", "dew", "dewy", "downpour", "drizzling", "drizzle", "droplet", "dry", "dust", "easterly", "fall", "falling", "flash", "flood", "flooding", "flurries", "flurry", "fog", "foggy", "fresh", "freeze", "freezing", "frost", "gale", "gentle", "gust", "gusts", "hail", "haze", "hazy", "heat", "heavy", "humid", "humidity", "hurricane", "ice", "icing", "icicle", "icy", "light", "lightning", "melt", "melting", "mild", "mist", "misty", "misting", "night", "nightfall", "overcast", "patchy", "piercing", "pouring", "rain", "rainbow", "raindrop", "rainfall", "rainstorm", "raining", "roads", "sandstorm", "season", "shower", "sky", "sleet", "slick", "slippery", "smog", "smoggy", "snow", "snowbank", "snowdrift", "snowfall", "snowflake", "snowstorm", "spring", "springtime", "steady", "storm", "strong", "summer", "summertime", "sun", "sunbeams", "sunlight", "sunrays", "sunrise", "sunset", "sunshine", "thaw", "thunder", "thunderbolt", "thunderclap", "thundercloud", "thunderstorm", "tornado", "tropical", "twilight", "typhoon", "warm", "westerly", "wet", "whirlwind", "wind", "windy", "windstorm", "winter", "wintertime" ]
  new_array = words.select { |e| keywords.include?(e) }
  if new_array.any?
    return new_array.join(" ")
  else
    return ["happy nature bob ross"]
  end
 end

end
