class AddRetinaDimensionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :retina_dimensions, :text
  end
end
