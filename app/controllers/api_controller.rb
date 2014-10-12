class ApiController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
  end

  def cadastrar_motorista
    motorista = Motorista.new
    motorista.user = params[:user]
    motorista.password = params[:password]
    motorista.nome = params[:nome]

    motorista.save

    @status = true
    @id = motorista.id
    @mensagem = "OK"

    render file: "api/status_json.json.erb", content_type: "application/json"
  end

  def cadastrar_carro
    carro = Carro.new
    carro.placa = params[:placa]

    carro.save

    @status = true
    @id = carro.id
    @mensagem = "OK"

    render file: "api/status_json.json.erb", content_type: "application/json"
  end

  def fazer_login
=begin
    if Motorista.login_valido? params[:user], params[:password]
      @status_params[:status] = true
      @status_params[:id] = Motorista.user(params[:user]).first.id
      @status_params[:mensagem] = "Login válido"
    else
      @status_params[:status] = false
      @status_params[:id] = 0
      @status_params[:mensagem] = "Login inválido"
    end
=end
    @status = true
    @id = Motorista.com_user(params[:user]).first.id
    @mensagem = "Login válido"

    render file: "api/status_json.json.erb", content_type: "application/json"
  end

  def info_motorista
    motorista = Motorista.find params[:id_motorista]

    render json: motorista.to_json
  end

  def add_credito
    motorista = Motorista.find params[:id_motorista]
    recarga = Recarga.create valor: params[:valor], motorista: motorista
    if motorista.creditos
      p "entrou"
      motorista.creditos += params[:valor].to_d
    else
      motorista.creditos = params[:valor].to_d
    end

    recarga.save
    motorista.save

    @status = true
    @id = recarga.id
    @mensagem = "Adicionado com sucesso"

    render file: "api/status_json.json.erb", content_type: "application/json"
  end

  def checkin
    motorista = Motorista.find params[:id_motorista]
    carro = Carro.find params[:id_carro]
    estacionamento = Estacionamento.create data_inicio: Time.now, motorista: motorista, carro: carro

    estacionamento.save

    render json: estacionamento.to_json

  end

  def checkout
    estacionamento = Estacionamento.find params[:id_estacionamento]
    estacionamento.data_final = Time.now

    estacionamento.save

    render json: estacionamento.to_json
  end

  def consultar_carro
    carro = Carro.pela_placa(params[:placa])

    carro.motorista.calcula_creditos

    @status = carro.motorista.tem_creditos?
    @id = carro.id
    @mensagem = "OK"

    render file: "api/status_json.json.erb", content_type: "application/json"
  end
end
