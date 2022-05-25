FactoryBot.define do
  factory :product_information do
    image {}
    name {'花'}
    description {'手作りです'}
    category_id {'レディース'}
    situation_id {'新品'}
    load_id {'送料込み(出品者負担)'}
    area_id {'東京都'}
    period_id {'2~3日で発送'}
    price {'1000'}
    
    
  end
end
