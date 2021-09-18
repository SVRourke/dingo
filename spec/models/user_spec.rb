require 'rails_helper'

RSpec.describe User do
  context "User" do
    example "can create a valid record" do
      user = User.create(username: "SVRourke", password: "BlahBlahBlah")
      expect(user.valid?).to be true
    end
    example "is invalid without username" do
      user = User.create(username: "", password: "password")
      expect(user.valid?).to be false
    end
    example "is invalid with a duplicate username" do
      User.create(username: "SAM", password: "password")
      user = User.create(username: "SAM", password: "password")
      expect(user.valid?).to be false
    end
    example "is invalid without password" do
      user = User.create(username: "SAMUEL", password: "")
      expect(user.valid?).to be false
    end
    
    example "is invalid with a password shorter than 8 characters" do
      user = User.create(username: "SAMUEL", password: "1234567")
      expect(user.valid?).to be false
    end

    example "has many images" do
      user = User.create(username: "SVRourke", password: "password1234")
      3.times do
        user.images.build(caption: "one")
      end
      user.save()
      expect(user.images.count).to eql 3
    end
    
    example "prevent orphan images when a user is deleted" do
      user = User.create(username: "sam rourke", password: "mangosmoothie")
      3.times do
        user.images.build(caption: "laskjfswjflkwjfe")
      end
      user.save()
      user.destroy()

      expect(Image.all.count).to eql 0
    end

    example "a user's tags are deleted when their account is" do
      user = User.create(username: "sam", password: "password")
      user.tags.create(name: "outdoors")
      user.tags.create(name: "family")
      user.destroy
      expect(Tag.count).to eql 0
    end
  end
  # pending "add some more to #{__FILE__}"
end
