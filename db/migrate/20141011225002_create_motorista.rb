class CreateMotorista < ActiveRecord::Migration
  def change
    create_table :motorista do |t|
      t.string :user
      t.string :password
      t.string :nome
      t.decimal :creditos

      t.timestamps
    end
  end
end
