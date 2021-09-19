require 'rails_helper'

RSpec.describe "Auth", type: :request do
  context "login" do
    it "GET: renders new" do
      get login_path
      expect(response).to render_template(:new)  
    end

    it "POST: invalid creds redirect back" do
      User.create(username: "sam", password: "password")
      post login_path, params: { username: "sam", password: "pasword"}
      expect(response).to redirect_to(login_path)

    end
    it "POST: invalid creds flash warning" do
      User.create(username: "sam", password: "password")
      post login_path, params: { username: "sam", password: "pasword"}
      expect(flash[:error]).to eql "Something went wrong"
    end

    it "POST: valid creds logs a user in" do
      User.create(username: "sam", password: "password")
      post login_path, params: { username: "sam", password: "password"}
      expect(response).to redirect_to(:image_index)  
    end
  end
  
  context "Logout" do
    it "DELETE: logs a user out" do
      User.create(username: "sam", password: "password")
      post login_path, params: { username: "sam", password: "password"}
      expect(response).to redirect_to(:image_index)  
    end
  end
    

end
