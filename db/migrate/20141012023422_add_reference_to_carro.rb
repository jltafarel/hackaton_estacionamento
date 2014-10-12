class AddReferenceToCarro < ActiveRecord::Migration
  def change
    add_reference :carros, :motorista, index: true
  end
end
