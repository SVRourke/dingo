require "rails_helper"

RSpec.describe "Users", type: :request do
  context "can create user" do
    it "POST: users_path with valid info creates a user" do
      post users_path, params: { user: { username: "sam", password: "password1234" } }
      expect(response.status).to eql 302
    end

    it "POST: users_path with valid info redirects to image index" do
      post users_path, params: { user: { username: "sam", password: "password1234" } }
      expect(response).to redirect_to(user_image_index_path(User.first))
    end

    it "creating a user logs the user in" do
      post users_path, params: { user: { username: "sam", password: "password1234" } }
      expect(session[:user_id]).to eql 1
    end
  end

  context "can delete a user" do
    it "DELETE: users_path deletes a user" do
      @user = User.create(username: "sam", password: "password")
      post login_path, params: { username: "sam", password: "password" }
      delete user_path(@user)
      expect(User.count).to eql 0
    end
  end
end
