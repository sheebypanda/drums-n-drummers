class Drummer < ActiveRecord::Base
  has_many :drums
  mount_uploader :picture, :PictureUploader
end
