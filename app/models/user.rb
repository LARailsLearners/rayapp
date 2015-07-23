class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :products, dependent: :destroy
  has_many :feedbacks  
  mount_uploader :avatar, AvatarUploader

  def admin?
  	role == "admin"
  end

  def name
    "#{self.email}"
  end

 
end
