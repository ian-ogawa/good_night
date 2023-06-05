class Validators::SleepCanNotLaterThanWakeUpValidator < ActiveModel::Validator
	def validate(record)
		last_sleep = record.user.clock_ins.sleeps.first
		last_wakeup = record.user.clock_ins.wake_ups.first
		record.errors.add(:clock_type, "sleep can't later than wake up") if last_sleep.clock_time > last_wakeup.clock_time
	end
end