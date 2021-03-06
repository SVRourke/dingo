require "rails_helper"
require "spec_helper"

RSpec.describe "Images", type: :request do
  before(:each) do
    @user = User.create(username: "sam", password: "password")
    @tag = @user.tags.create(name: "outdoors")
    @file = fixture_file_upload("/dingo.jpeg", "image/jpeg")
    @files = []
    5.times do
      @files.push(fixture_file_upload("/dingo.jpeg", "image/jpeg"))
    end

    post login_path, params: { username: "sam", password: "password" }
    expect(session[:user_id]).to eql @user.id
  end

  context "validations" do
    it "can create a valid image" do
      post user_image_index_path(@user), params: { image: { image_file: [@file] } }
      expect(Image.first.valid?).to be true
    end
  end

  it "can delete images" do
    @image = @user.images.create(title: "hello")
    delete user_image_path(@user, @image)
    expect(Image.all.count).to eql 0
  end

  it "can show images" do
    @image = @user.images.create(title: "hello", image_file: @file)
    get user_image_path(@user, @image)
    expect(response).to be_successful
  end
end
