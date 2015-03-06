class SensorController < ApplicationController
  def index
    @data = Sensor.limit(30).order("created_at desc")
    @data_status = Sensor.limit(8).order("created_at desc")
    # @data_status = Sensor.select{ |item| item[:status] == 'OPEN' }.count

  end
  def admin
    @data = Sensor.limit(30).order("created_at desc")
    @data_status = Sensor.limit(8).order("created_at desc")
    # @data_status = Sensor.select{ |item| item[:status] == 'OPEN' }.count

  end
end
