# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :motoristum, :class => 'Motorista' do
    user "MyString"
    password "MyString"
    nome "MyString"
    creditos ""
  end
end
