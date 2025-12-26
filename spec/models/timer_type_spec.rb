require 'rails_helper'

RSpec.describe "Api::V1::Timers", type: :model do
  describe "Everything relatoned by Timer Types" do
    it "create a new timer type to express 25 minutes" do
      new_timer_type = TimerType.create!(name: "Pomodoro - Normal", seconds: 1500)

      expect(new_timer_type.seconds).to eq((25*60))
    end
  end
end
