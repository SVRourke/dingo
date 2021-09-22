require "rails_helper"

RSpec.describe User do
  before(:each) do
    @user = User.create(username: "SVRourke", password: "BlahBlahBlah")
    3.times do
      @user.images.create(title: "laskjfswjflkwjfe")
    end
    @user.tags.create(name: "outdoors")
  end

  context "validations" do
    it "can create a valid record" do
      expect(@user.valid?).to be true
    end

    it "is invalid without username" do
      user = User.create(username: "", password: "password")
      expect(user.valid?).to be false
    end

    it "is invalid with a duplicate username" do
      user = User.create(username: "SVRourke", password: "BlahBlahBlah")
      expect(user.valid?).to be false
    end

    it "is invalid without password" do
      user = User.create(username: "SAMUEL", password: "")
      expect(user.valid?).to be false
    end

    it "is invalid with a password shorter than 8 characters" do
      user = User.create(username: "SAMUEL", password: "1234567")
      expect(user.valid?).to be false
    end
  end

  context "images" do
    it "has many images" do
      expect(@user.images.count).to eql 3
    end

    it "prevent orphan images when a user is deleted" do
      @user.destroy()
      expect(Image.all.count).to eql 0
    end
  end

  context "tags" do
    it "has many tags" do
      expect(@user.tags.count).to eql 1
    end
    it "a user's tags are deleted when their account is" do
      @user.destroy
      expect(Tag.count).to eql 0
    end
  end
end
