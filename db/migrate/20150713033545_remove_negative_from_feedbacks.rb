class RemoveNegativeFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :negative, :boolean
  end
end
