class Product < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true
  validates :description, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }, presence: true
  validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }, presence: true
  validates :upc_code, length: {minimum: 9}, presence: true
  validates :upc_code, length: {maximum: 9}
end
