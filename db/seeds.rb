require 'factory_bot_rails'
require 'faker'

Patient.destroy_all

10.times do
    FactoryBot.create(:patient)
  end