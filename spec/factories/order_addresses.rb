FactoryBot.define do
  factory :order_address do
    postal_code                     { '111-1111' }
    prefecture_id                   { 2 }
    city                            { 'なんとか市' }
    house_number                    { 'なんとか' }
    building_name                   { 'なんとかビル' }
    phone_number                    { '09011111111' }
    token                           { 'tok_abcdeefghijk00000000000000000' }
  end
end
