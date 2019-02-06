class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

  response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=DEMO_KEY&location=1617+Cole+Blvd+Golden+CO&fuel_type=ELEC&limit=10")

  @station = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
