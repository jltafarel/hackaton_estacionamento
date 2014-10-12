class ModifyFieldsEstacionamento < ActiveRecord::Migration
  def change
    change_column :estacionamentos, :data_inicio, :datetime
    change_column :estacionamentos, :data_final, :datetime
  end
end
