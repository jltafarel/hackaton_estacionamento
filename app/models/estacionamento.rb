class Estacionamento < ActiveRecord::Base
  belongs_to :motorista
  belongs_to :carro

  scope :estacionados, -> {
    where :data_fim.blank?
  }
end
