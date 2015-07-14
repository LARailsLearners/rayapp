class AddBodyToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :body, :text
  end
end
