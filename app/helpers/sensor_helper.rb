module SensorHelper
  def current_state(status)
    @last_five = status.all.map(&:status)
    if @last_five == ["OPEN", "OPEN", "OPEN", "OPEN", "OPEN", "OPEN", "OPEN", "OPEN"]
      link_to 'The Table is Open!', '#', :class => 'btn btn-lg btn-alert alert-success', :role => 'button'
    else
      link_to 'The Table is Busy!', '#', :class => 'btn btn-lg btn-alert alert-danger', :role => 'button'
    end
  end
end
