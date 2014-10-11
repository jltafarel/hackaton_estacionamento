# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estacionamento do
    motorista nil
    carro nil
    data_inicio "2014-10-11"
    data_final "2014-10-11"
  end
end
