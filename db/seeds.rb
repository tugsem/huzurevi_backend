require 'factory_bot_rails'
require 'faker'

Patient.destroy_all
Stock.destroy_all

(1..20).each do |id|
    Patient.create!(
      id: id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.birthday,
      contact_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      address: Faker::Address.full_address
    )
    Stock.create!(
      id: id,
      name: Faker::Commerce.product_name,
      quantity: Faker::Number.within(range: 10..200),
      unit: Faker::Base.sample(['pcs', 'kg'])
    )    
  end