class SensorController < ApplicationController
  def index
    @data = Sensor.limit(20).order("created_at desc")
    @data_status = Sensor.all.order("created_at desc").last
  end
end
