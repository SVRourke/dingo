require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "can create a valid tag" do
    user = User.create(username: "SVRourke", password: "password")
    tag = user.tags.create(name: "outdoors")
    expect(tag.valid?).to eql true
  end
  
  it "invalid without name" do
    user = User.create(username: "SVRourke", password: "password")
    tag = user.tags.create()
    expect(tag.valid?).to eql false
  end
  
  it "has many images" do
    user = User.create(username: "SVRourke", password: "password")
    tag = user.tags.create(name: "outdoors")
    tag.images.push(user.images.create(caption: "mountain"))
    expect(tag.images.length).to eql 1    
  end


  # pending "add some examples to (or delete) #{__FILE__}"
end
