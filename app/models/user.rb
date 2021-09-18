class User < ApplicationRecord
    has_secure_password

    validates :username, presence: {message: "User must have a name."}
    validates :username, uniqueness: {message: "That username is already taken."}
    validates :password, length: {minimum: 8, message: "Password must be at least 8 characters long."}
end
