require 'rails_helper'

RSpec.describe "Tags", type: :request do
  context "index" do
    it "shows a user's images for the selected tag" do
      @user = User.create(username: "sam", password: "password")
      post login_path, params: {username: "sam", password: "password"}

      @tag = @user.tags.create(name: "outdoors")
      get user_tags_path(@user, @tag)
      
      expect(response).to be_successful   
    end
  end

  context "create a tag" do
    it "valid info is successful" do
      @user = User.create(username: "sam", password: "password")
      post login_path, params: {username: "sam", password: "password"}
      
      expect(session[:user_id]).to eql @user.id
      post user_tags_path(@user), params: {tag: {name: "outdoors"}}
      expect(@user.tags.length).to eql 1
    end
  end

  context "image" do
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

     @updated_image = Image.find(@image.id)

     expect(@updated_image.tags.length).to eq 0
      
    end
  end
end
