FactoryBot.define do
  factory :user do
    nickname                        {"spec"}
    email                           {"test@spec"}
    first_name                      {"スペック"}
    last_name                       {"太郎"}
    first_reading                   {"スペック"}
    last_reading                    {"タロウ"}
    birthday                        {"1930-01-01"}
    password                        {"spec1234"}
    password_confirmation           {password}
  end
end