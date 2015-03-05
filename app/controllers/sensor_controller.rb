class SensorController < ApplicationController
  def index
    @status = Sensor.last
  end
end
