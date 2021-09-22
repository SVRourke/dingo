class User < ApplicationRecord
  has_secure_password

  validates :username, presence: { message: "User must have a name." }
  validates :username, uniqueness: { message: "That username is already taken." }
  validates :password, length: { minimum: 8, message: "Password must be at least 8 characters long." }

  has_many :images, dependent: :destroy
  has_many :tags, dependent: :destroy

  def bulkCreateImages(images)
    imgs = []
    images.each do |image|
      imgs.push(self.images.create(title: image.original_filename.split(".")[0], image_file: image))
    end
    return imgs
  end
end
