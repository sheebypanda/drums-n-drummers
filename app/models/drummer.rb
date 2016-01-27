class Drummer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :picture, presence:true
  has_many :drums,dependent: :destroy
  mount_uploader :picture, PictureUploader
end
