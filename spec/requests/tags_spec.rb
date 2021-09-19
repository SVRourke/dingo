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
    
  end
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
