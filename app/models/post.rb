class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 10 }
	validates :body, :summary, presence: true

	mount_uploader :image, ImageUploader
end
