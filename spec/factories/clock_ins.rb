FactoryGirl.define do
  factory :clock_in_sleep, class: "ClockIn" do
    user
    clock_type :sleep
    clock_time Time.now
  end

  factory :clock_in_wake_up, class: "ClockIn" do
    user
    clock_type :wake_up
    clock_time Time.now
  end
end
