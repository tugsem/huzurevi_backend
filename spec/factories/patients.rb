FactoryBot.define do 
    factory :patient do
        first_name {'John'}
        last_name {'Doe'}
        date_of_birth {'Wed, 10 Oct 1979'}
        contact_number {'(908) 206-0667'}
        email {'sudie@wunsch-turner.example'}
        address {'Suite 171 339 Kreiger Green, New Russelville, KS 66004'}
    end
end