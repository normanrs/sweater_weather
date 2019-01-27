class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :summary,
              :current_temp,
              :high_temp,
              :low_temp,
              :date_and_time,
              :city_state,
              :timezone,
              :latitude,
              :longitude,
              :hourly_summary,
              :daily_summary,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :gif_url,
              :hourlies,
              :dailies

end
