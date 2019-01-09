# Sweater Weather
> A Ruby on Rails weather API.

Returns weather data at a supplied location, including current conditions, forecast, and a gif representing daily conditions. Allows users to register and login to a session. Users can save favorite locations.

## Setup

OS X & Linux:

```sh
bundle
rspec (to run tests)
rails s (to spin up the server)
```

## Usage

While the server is running, you have access to the following endpoints:

USERS: POST "/api/v1/users"
params: email, password, password_confirmation
response: a unique API key

SESSIONS: POST "/api/v1/sessions"
params: email, password
response: your API key

FORECAST: GET "/api/v1/forecast"
params: location (as a single city/state string, ex: Denver,CO)
response: a weather report including current conditions, forecast, and a GIF representing daily conditions

FAVORITES: POST "/api/v1/favorites?"
params: location, api_key
response: your list of location favorites

FAVORITES: GET "/api/v1/favorites?"
params: api_key
response: your list of location favorites

FAVORITES: DELETE "/api/v1/favorites?"
params: location, api_key
response: your list of location favorites (location supplied in request omitted)

DAILY GIF: GET "/api/v1/gifs"
params: location
response: a short weather summary and gif at location

## Release History

* 1.0
    * Completed Turing assignment. All tests passing with test coverage at 99.74%.

## Meta

Norm Schultz – [@normanrs](https://twitter.com/normanrs)
[https://github.com/normanrschultz](https://github.com/normanrschultz/)

## Contributing

1. Fork this repo
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
