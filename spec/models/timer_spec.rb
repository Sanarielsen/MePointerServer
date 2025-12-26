require 'rails_helper'

RSpec.describe "Api::V1::Timers", type: :model do
  describe "Everything relatoned by Timers" do
    describe "Create a simple timer with specific title" do
      let(:timer) { Timer.new(name: "Ir para a acadêmia") }
      it "Create with name, type, createdAt and updatedAt" do
        expect(timer.name).to eq("Ir para a acadêmia")
      end
    end

    it "return new timer id when I created it" do
      timer_type = TimerType.create!(name: "Pomodoro - Normal", seconds: 1500)
      Rails.logger.info(timer_type.attributes)

      new_timer = Timer.create!(name: "Iniciando os estudos em Ruby", timer_type_id: timer_type.id)
      expect(new_timer.id).to be_present
    end

    it "create 6 timers with 3 different cycles to simulate a normal pomodoro cycle" do
      # Type of timers
      new_timer_type_normal = TimerType.create!(name: "Pomodoro - Normal", seconds: 1500)
      new_timer_type_pause_normal = TimerType.create!(name: "Pomodoro - Cut", seconds: 300)
      new_timer_type_pause_long = TimerType.create!(name: "Pomodoro - Long", seconds: 900)
      # Cycle 1
      Timer.create!(name: "Iniciando os estudos em Ruby", timer_type_id: new_timer_type_normal.id)
      Timer.create!(name: "Deitar um pouco", timer_type_id: new_timer_type_pause_normal.id)
      # Cycle 2
      Timer.create!(name: "Lendo mais a documentação do Ruby", timer_type_id: new_timer_type_normal.id)
      Timer.create!(name: "Lavar a louça do café da manhã", timer_type_id: new_timer_type_pause_normal.id)
      # Cycle 3
      Timer.create!(name: "Consultando sobre os testes da aplicacao", timer_type_id: new_timer_type_normal.id)
      Timer.create!(name: "Preparar o almoço", timer_type_id: new_timer_type_pause_long.id)

      expect(Timer.count).to eq(6)
    end
  end
end
