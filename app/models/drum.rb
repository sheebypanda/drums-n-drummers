class Drum < ActiveRecord::Base
  validates :picture, presence: true, uniqueness: true
  belongs_to :drummer
  mount_uploader :picture, PictureUploader
end
