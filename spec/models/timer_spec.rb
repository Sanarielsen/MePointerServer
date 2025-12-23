require 'rails_helper'

# Describe para chamada, a entidade e o tipo (define se é model ou não)
RSpec.describe Timer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Create timer" do
    let(:timer) { Timer.new(name: "Ir para a acadêmia") }
    it "Create with name, type, createdAt and updatedAt" do
      expect(timer.name).to eq("Ir para a acadêmia")
    end
  end

  # describe "Check if the hour we created to this timer was lower than the current hour" do
  #   pending "Test will be developer soon"
  # end

  # describe "Delete a timer have an specific id" do
  #   pending "Test will be developer soon"
  # end

  # describe "Strucuture the history to show all the timer in a application" do
  #   pending "Test will be developer soon"
  # end
end
