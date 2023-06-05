class ClockIn < ApplicationRecord
	include ClockInAccessor
	default_scope { order(created_at: :desc) }

  belongs_to :user

  enum clock_type: { sleep: 'sleep', wake_up: 'wake_up' }

  scope :sleeps, ->{ where(clock_type: :sleep) }
  scope :wake_ups, ->{ where(clock_type: :wake_up) }

  before_save :set_clock_time

  validates_with Validators::NeedSleepBeforeWakeUpValidator, if: -> { clock_type.eql?('wake_up') }
  validates_with Validators::NeedWakeUpBeforeSleepValidator, if: -> { clock_type.eql?('sleep') }
  validates_with Validators::SleepCanNotLaterThanWakeUpValidator, if: -> { clock_type.eql?('sleep') }

  private
  	def set_clock_time
  		self.clock_time = Time.now
  	end
end
