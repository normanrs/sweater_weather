class DailyGifSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :summary, :url, :copyright
end
