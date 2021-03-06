class Product < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  include Bootsy::Container

  scope :no_image,-> {where(:image => nil)}
  # scope :All, -> {}
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  # validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true
  validates :description, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }, presence: true
  validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }, presence: true
  validates :upc_code, length: {minimum: 9}, presence: true
  validates :upc_code, length: {maximum: 9}
  mount_uploader :image, ImageUploader

  # It returns the products whose names contain one or more words form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    Product.where("LOWER(name) like ? OR LOWER(description) like?", "%#{query.downcase}%", "%#{query.downcase}%") 
  end
end
