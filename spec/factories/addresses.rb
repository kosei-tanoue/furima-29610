FactoryBot.define do
  factory :address do
    postal_code                     {1111111}
    prefecture_id                   {2}
    city                            {"なんとか市"}
    house_number                    {"なんとか"}
    building_name                   {"なんとかビル"}
    phone_number                    {"09011111111"}
    association :order
  end
end
