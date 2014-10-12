class Motorista < ActiveRecord::Base

  has_many :carros
  has_many :recargas
  has_many :estacionamentos

  scope :com_user, ->(user) {
    find_by user: user
  }
  scope :login_valido?, ->(user, password) {
    m = com_user(user)
    if m.password.eql? password
      return true
    end
  }

  def tem_creditos?
    creditos > 0 ? true : false
  end

  def calcula_creditos
    estacionamento = estacionamentos.estacionados.last

    if !estacionamento.blank?
      tempo_decorrido = (Time.now - estacionamento.data_inicio).to_i.abs

      self.creditos -= (tempo_decorrido * 0.00010)
    end
     save
  end

  def tempo_restante
    self.calcula_creditos
    estacionamento = self.estacionamentos.estacionados.last

    tempo_decorrido = (Time.now - estacionamento.data_inicio)
    tempo_disponivel = (self.creditos / 0.05) * 60

    tempo_atualizado = tempo_disponivel - tempo_decorrido

    tempo_atualizado * 1000
  end
end
