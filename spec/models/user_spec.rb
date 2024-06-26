require 'rails_helper'

RSpec.describe User, :type => :model do 
     it 'creates admin user' do
        admin_user = FactoryBot.build(:admin)
        expect(admin_user.admin).to be_truthy
        expect(admin_user).to be_valid
    end
    it 'creates regular user' do
        user = FactoryBot.build(:user)
        expect(user.admin).to be_falsey
    end
    it 'is valid with a valid username and password' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
    end
    it 'is raise error when same username is taken' do
        user = FactoryBot.create(:user, username: "same_username", password: "123123")
        anotheruser = FactoryBot.build(:user, username: "same_username", password: "sfsdgs")
        expect(user).to be_valid
        expect(anotheruser).to be_invalid
        expect(anotheruser.errors[:username]).to include("has already been taken")
    end

    it 'is valid password' do 
        user = FactoryBot.build(:user, password:"")
        expect(user).to be_invalid
    end
end