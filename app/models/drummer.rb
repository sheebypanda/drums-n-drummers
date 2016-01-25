class Drummer < ActiveRecord::Base
  validates :name, :picture, presence: true 
  has_many :drums
  mount_uploader :picture, PictureUploader
end
