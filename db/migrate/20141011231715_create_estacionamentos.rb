class CreateEstacionamentos < ActiveRecord::Migration
  def change
    create_table :estacionamentos do |t|
      t.references :motorista, index: true
      t.references :carro, index: true
      t.date :data_inicio
      t.date :data_final

      t.timestamps
    end
  end
end
