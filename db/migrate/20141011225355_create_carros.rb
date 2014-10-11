class CreateCarros < ActiveRecord::Migration
  def change
    create_table :carros do |t|
      t.string :placa

      t.timestamps
    end
  end
end
