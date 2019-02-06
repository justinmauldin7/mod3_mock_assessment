class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=#{params[:q]}&radius=6.0&fuel_type=ELEC&fuel_type=LPG&limit=10")

    results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = results.map do |result|
      Station.new(result)
    end
  end
end
