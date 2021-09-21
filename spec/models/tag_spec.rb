require "rails_helper"

RSpec.describe Tag do
  before(:each) do
    @user = User.create(username: "SVRourke", password: "password")
    @tag = @user.tags.create(name: "outdoors")
  end

  context "validations" do
    it "can create a valid tag" do
      expect(@tag.valid?).to eql true
    end

    it "invalid without name" do
      tag = @user.tags.create()
      expect(tag.valid?).to eql false
    end
  end

  context "images" do
    it "has many images" do
      @tag.images.push(@user.images.create(caption: "mountain"))
      expect(@tag.images.length).to eql 1
    end
  end
end
