class SensorController < ApplicationController
  def index
    @data = Sensor.limit(30).order("created_at desc")
    @data_status = Sensor.limit(20).order("created_at desc")
  end
end
