class Image < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  has_one_attached :image_file
end
