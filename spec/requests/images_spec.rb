require "rails_helper"
require "spec_helper"

RSpec.describe "Images", type: :request do
 
  before(:each) do
    @user = User.create(username: "sam", password: "password")
    @tag = @user.tags.create(name: "outdoors")
    
    post login_path, params: { username: "sam", password: "password" }
    expect(session[:user_id]).to eql @user.id
    # @file = Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/dingo.jpeg", "image/jpeg")

    @file = fixture_file_upload('/dingo.jpeg', "image/jpeg")
  end

  context "create image" do
    it "can create a valid image" do
      post user_image_index_path(@user), params: { image: { caption: "blah blah blah", image_file: @file } }
      @image = Image.find_by(caption: "blah blah blah")
      expect(@image.valid?).to be true
    end

    it "adds tags when provided as part of the request" do
      post user_image_index_path(@user), params: { image: { caption: "blah blah blah", tag_ids: [@tag.id] } }
      @image = Image.find_by(caption: "blah blah blah")
      expect(@image.tags.first.id).to be @tag.id
    end
  end

  it "can delete images" do
    @image = @user.images.create(caption: "hello")
    delete user_image_path(@user, @image)
    expect(Image.all.count).to eql 0
  end

  it "can show images" do
    @image = @user.images.create(caption: "hello", image_file: @image)
    get user_image_path(@user, @image)
    expect(response).to be_success
  end
end
