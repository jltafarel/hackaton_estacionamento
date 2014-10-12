class RestController < ApplicationController

  def cadastar_motorista
    motorista = Motorista.new
    motorista.user = params[:user]
    motorista.password = params[:password]
    motorista.nome = params[:nome]

    motorista.save

    @status_params[:status] = true
    @status_params[:id] = motorista.id
    @status_params[:mensagem] = "OK"

    render file: "status_json"
  end

  def cadastrar_carro
    carro = Carro.new
    carro.placa = params[:placa]

    carro.save

    @status_params[:status] = true
    @status_params[:id] = carro.id
    @status_params[:mensagem] = "OK"

    render file: "status_json"
  end

  def fazer_login
    if Motorista.login_valido? params[:user], params[:password]
      @status_params[:status] = true
      @status_params[:id] = Motorista.user(params[:user]).first.id
      @status_params[:mensagem] = "Login válido"
    else
      @status_params[:status] = false
      @status_params[:id] = 0
      @status_params[:mensagem] = "Login inválido"
    end

    render file: "status_json"
  end

  def info_motorista
    motorista = Motorista.find params[:id_motorista]

    render json: motorista.to_json
  end

  def add_credito
    motorista = Motorista.find params[:id_motorista]
    recarga = Recarga.create valor: params[:valor], motorista: motorista

    recarga.save

    @status_params[:status] = true
    @status_params[:id] = recarga.id
    @status_params[:mensagem] = "Adicionado com sucesso"

    render file: "status_json"
  end

  def checkin
    motorista = Motorista.find params[:id_motorista]
    estacionamento = Estacionamento.create data_inicio: Time.now, motorista: motorista

    estacionamento.save

    render json: estacionamento.to_json

  end

  def checkout
    estacionamento = Estacionamento.find params[:id_estacionamento]
    estacionamento.data_fim = Time.now

    estacionamento.save

    render json: estacionamento.to_json
  end

  def consultar_carro
    carro = Carro.pela_placa(params[:placa]).first

    @status_params[:status] = true
    @status_params[:id] = recarga.id
    @status_params[:mensagem] = "OK"
    @status_params[:tempo_restante] = carro.tempo_restante

    render file: "status_json"
  end
end
