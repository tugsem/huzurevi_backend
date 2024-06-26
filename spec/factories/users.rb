FactoryBot.define do
    factory :user do
        username { 'Jane Doe' }
        password { 'password' }
    end

    factory :admin, class: User do
        username { 'admin' }
        password { 'password' }
        admin { true }
    end
end