class Validators::NeedSleepBeforeWakeUpValidator < ActiveModel::Validator
	def validate(record)
		record.errors.add(:clock_type, "must sleep before wake up") if record.last_clocked_in.clock_type.eql?('wake_up')
	end
end