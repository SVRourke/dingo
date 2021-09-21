require "rails_helper"

RSpec.describe "Users", type: :request do
  before(:each) do
    post users_path, params: { user: { username: "sam", password: "password1234" } }
  end
  context "can create user" do
    it "POST: users_path with valid info creates a user" do
      expect(response.status).to eql 302
      expect(User.all.count).to eql 1
    end

    it "POST: users_path with valid info redirects to image index" do
      expect(response).to redirect_to(user_image_index_path(User.first))
    end

    it "creating a user logs the user in" do
      expect(session[:user_id]).to eql 1
    end
  end

  context "can delete a user" do
    it "users_path deletes a user" do
      session
      post login_path, params: {}
      delete user_path(session[:user_id])
      expect(response).to redirect_to :root
      expect(User.count).to eql 0
    end
  end
end
