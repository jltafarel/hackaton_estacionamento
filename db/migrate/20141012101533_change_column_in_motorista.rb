class ChangeColumnInMotorista < ActiveRecord::Migration
  def change
    change_column :motorista, :creditos, :decimal, default: 0
  end
end
