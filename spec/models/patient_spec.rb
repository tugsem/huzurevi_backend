require 'rails_helper'

RSpec.describe Patient, :type => :model do 
    FactoryBot.create(:patient)
    it "creates patient with valid attributes" do
        patient = FactoryBot.build(:patient)
        expect(patient).to be_valid
    end
end