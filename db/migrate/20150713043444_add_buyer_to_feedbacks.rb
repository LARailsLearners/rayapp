class AddBuyerToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :buyer, :integer
  end
end
