class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
  validates_associated :post
  validates_associated :tag
  # validates :user

end
