class CreateRecargas < ActiveRecord::Migration
  def change
    create_table :recargas do |t|
      t.date :data
      t.numeric :valor
      t.references :motorista, index: true

      t.timestamps
    end
  end
end
