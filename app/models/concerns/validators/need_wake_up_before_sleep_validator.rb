class Validators::NeedWakeUpBeforeSleepValidator < ActiveModel::Validator
	def validate(record)
		record.errors.add(:clock_type, "must wake up before sleep") if record.last_clocked_in.clock_type.eql?('sleep')
	end
end