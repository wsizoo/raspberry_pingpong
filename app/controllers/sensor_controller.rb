class SensorController < ApplicationController
  def index
    @data = Sensor.limit(30).order("created_at desc")
    @data_status = Sensor.all.order("created_at desc").first
  end
end
