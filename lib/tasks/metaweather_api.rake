require 'net/http'

@rains = [
  'Heavy Rain',
  'Light Rain',
  'Showers'
]

namespace :metaweather_api do
  desc 'indicates if it rains tomorrow'
  task :tomorrow_rain, :city do |_t, arguments|
    abort("Pass a city in argument like 'rake metaweather_api:tomorrow_rain[paris]'") if arguments.city.nil?

    location = call_api("https://www.metaweather.com/api/location/search/?query=#{arguments.city}")
    abort("We don't know the city sorry") if location.empty?

    weathers = call_api("https://www.metaweather.com/api/location/#{location[0]['woeid']}/")
    weather = tomorrow_weather(weathers)

    puts @rains.include?(weather['weather_state_name']) ? 'It rains tomorrow' : 'No rains tomorrow'
  end
end

def call_api(url)
  uri = URI(url)
  response = Net::HTTP.get_response(uri)

  JSON.parse(response.body)
end

def tomorrow_weather(weathers)
  weathers['consolidated_weather'].find do |weather|
    weather_applicable_date = Date.strptime(weather['applicable_date'], '%Y-%m-%d')
    weather_applicable_date == Date.tomorrow
  end
end
