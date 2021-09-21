require "rails_helper"

RSpec.describe "Auth", type: :request do
  before(:each) do
    @user = User.create(username: "sam", password: "password")
  end
  context "login" do
    it "GET: renders new" do
      get login_path
      expect(response).to render_template(:new)
    end

    it "invalid creds redirects back" do
      post login_path, params: { username: "sam", password: "pasword" }
      expect(response).to redirect_to(login_path)
    end

    it "invalid creds trigger flash" do
      post login_path, params: { username: "sam", password: "pasword" }
      expect(flash[:error]).to eql "Invalid credentials"
    end

    it "POST: valid creds logs a user in" do
      post login_path, params: { username: "sam", password: "password" }
      expect(session[:user_id]).to eql @user.id
    end
    it "redirects if user is logged in" do
      post login_path, params: { username: "sam", password: "password" }
      expect(session[:user_id]).to eql @user.id

      get login_path
      expect(response).to redirect_to(user_image_index_path(@user))
    end
  end

  context "Logout" do
    it "DELETE: logs a user out" do
      post login_path, params: { username: @user.username, password: "password" }
      expect(session[:user_id]).to eql @user.id

      delete logout_path
      expect(session[:user_id]).to eql nil
    end
  end
end
