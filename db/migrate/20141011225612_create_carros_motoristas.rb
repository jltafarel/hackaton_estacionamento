class CreateCarrosMotoristas < ActiveRecord::Migration
  def change
    create_table :carros_motoristas do |t|
      t.references :motorista, index: true
      t.references :carro, index: true

      t.timestamps
    end
  end
end
