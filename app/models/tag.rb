class Tag < ApplicationRecord
    has_and_belongs_to_many :images
    belongs_to :user

    validates :name, presence: {message: "Tag cannot be empty."}
    validates :name, uniqueness: {message: "Tag already exists."}

end
