FactoryBot.define do
  factory :product_information do
    association :user
    name {'花'}
    description {'手作りです'}
    category_id {2}
    situation_id {2}
    load_id {2}
    area_id {2}
    period_id {2}
    price {1000}
  
    



    after(:build) do |product_information|
      product_information.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    
  end
end
