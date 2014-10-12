class Carro < ActiveRecord::Base
  belongs_to :motorista
  has_many :estacionamentos

  scope :pela_placa, ->(placa) {
    find_by placa: placa
  }

  scope :estacionados, -> {
    where estacionamentos.estacionados
  }

  def pode_estacionar?
    estacionamentos.estacionados.blank?
  end

  def tem_credito?

  end
end
