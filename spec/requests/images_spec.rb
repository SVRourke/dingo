require 'rails_helper'

RSpec.describe "Images", type: :request do
  context "create image" do
    # valid info can create an image
  end

  context "tags" do
    it "can add a tag" do
      @user = User.create(username: "sam", password: "password")
      post login_path, params: {username: "sam", password: "password"}

      @image = @user.images.create(caption: "blah blahblah")
      @tag = @user.tags.create(name: "Outdoors")
      
      post add_user_image_tag_path(@user, @image, @tag)
      expect(@image.tags.length).to eql 1
      
    end
    
    it "can remove tag" do
      @user = User.create(username: "sam", password: "password")
      post login_path, params: {username: "sam", password: "password"}
      
      @image = @user.images.create(caption: "blah blahblah")
      @tag = @user.tags.create(name: "Outdoors")

     @image.tags.push(@tag)
     post remove_user_image_tag_path(@user.id, @image.id, @tag.id)
     expect(@image.tags.length).to eq; 0
      
    end
    
  end

end
