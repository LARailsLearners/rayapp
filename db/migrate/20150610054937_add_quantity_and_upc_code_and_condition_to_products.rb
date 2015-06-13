class AddQuantityAndUpcCodeAndConditionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :quantity, :integer
    add_column :products, :upc_code, :varchar
    add_column :products, :condition, :string
  end
end
