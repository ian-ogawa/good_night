class ClockInSerializer < ActiveModel::Serializer
  attributes :id, :clock_type, :clock_time

  def clock_time
  	object.clock_time.nil? ? '-' : object.clock_time.strftime("%d-%B-%Y %H:%M")
  end
end
