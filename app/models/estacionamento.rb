class Estacionamento < ActiveRecord::Base
  belongs_to :motorista
  belongs_to :carro
end
