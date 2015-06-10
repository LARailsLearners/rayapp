class Product < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }
end
