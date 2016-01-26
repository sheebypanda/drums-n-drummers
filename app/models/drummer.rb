class Drummer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :drums
  mount_uploader :picture, PictureUploader
end
