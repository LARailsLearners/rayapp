class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  # def name
  #   "#{self.body}"
  # end
end
