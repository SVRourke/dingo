require "rails_helper"

RSpec.describe Image do
  context "validation" do
    it "creates a valid image" do
      image = Image.create(title: "hello")
    end
  end

  context "tags" do
    it "has many tags" do
      user = User.create(username: "SVROURKE", password: "password")
      img = user.images.create(title: "vlbajofjsf")
      tag = user.tags.create(name: "outdoors")
      img.tags.push(tag)
      expect(img.tags.count).to eql 1
    end
  end
end
