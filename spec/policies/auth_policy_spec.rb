require "spec_helper"
require "rails_helper"

describe AuthPolicy do
  subject { AuthPolicy }

  before(:each) do
    @tony = User.create(username: "TonySoprano", password: "password")
    @junior = User.create(username: "JuniorSoprano", password: "password")
    @tag = @tony.tags.create(name: "outdoors")
    @jtag = @junior.tags.create(name: "indoors")
  end

  permissions :new? do
    it "a logged out user can see login page" do
      expect(subject).to permit(nil)
    end
    it "a logged in user cannot see login page" do
      expect(subject).not_to permit(@tony)
    end
  end

  permissions :create? do
    it "a logged out user can create a new user" do
      expect(subject).to permit(nil)
    end
    it "a logged in user cannot see create a new user" do
      expect(subject).not_to permit(@tony)
    end
  end

  permissions :destroy? do
    it "a user can only log themselves out" do
      expect(subject).not_to permit(nil, @tony.id)
    end
    it "a user can log themselves out" do
      expect(subject).to permit(@tony, @tony.id)
    end
  end
end
