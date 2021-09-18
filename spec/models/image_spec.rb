require 'rails_helper'

RSpec.describe Image, type: :model do
  it "creates a valid image" do
    puts User.first
    image = Image.create
  end

  it "has many tags" do
    user = User.create(username: "SVROURKE", password: "password")
    img = user.images.create(caption: "vlbajofjsf")
    tag = user.tags.create(name: "outdoors")
    img.tags.push(tag)
    expect(img.tags.count).to eql 1
  end
  # pending "add some examples to check attached file #{__FILE__}"
end
