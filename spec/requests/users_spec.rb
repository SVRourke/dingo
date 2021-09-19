require 'rails_helper'

RSpec.describe "Users", type: :request do

  context "can create user" do
    it "POST: user_path with valid info creates a user" do
      post user_path, params: {user: {username: "sam", password: "password1234"}}
      expect(response.status).to eql 302
    end
    
    it "POST: user_path with valid info redirects to image index" do
      post user_path, params: {user: {username: "sam", password: "password1234"}}
      expect(response).to redirect_to(image_index_path)
    end
    
    it "creating a user logs the user in" do
      post user_path, params: {user: {username: "sam", password: "password1234"}}
      # byebug
      expect(session[:user_id]).to eql 1
    end
  end

  context "can delete a user" do
    it "DELETE: user_path deletes a user" do
      # TODO
    end
  end
end
