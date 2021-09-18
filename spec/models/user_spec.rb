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
  end
  # pending "add some more to #{__FILE__}"
end
