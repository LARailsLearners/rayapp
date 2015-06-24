class RemoveRetinaDimensionsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :retina_dimensions, :text
  end
end
