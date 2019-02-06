class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_time

  def initialize(attributes = {})
    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_type = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_time = attributes[:access_days_time]
  end
end
