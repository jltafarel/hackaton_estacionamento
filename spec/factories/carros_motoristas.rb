# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :carros_motorista, :class => 'CarroMotorista' do
    motorista nil
    carro nil
  end
end
