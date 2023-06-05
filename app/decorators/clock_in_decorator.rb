class ClockInDecorator < Draper::Decorator
  delegate_all

  def clock_time
    object.clock_time.nil? ? '-' : object.clock_time.strftime("%d-%B-%Y %H:%M")
  end

end
