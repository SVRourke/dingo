require "spec_helper"
require "rails_helper"

describe UserPolicy do
  subject { UserPolicy }

  before(:each) do
    @sherlock = User.create(username: "sherlock", password: "password")
    @watson = User.create(username: "watson", password: "password")
  end

  permissions :destroy? do
    it "a user cannot delete another user" do
      expect(subject).not_to permit(@watson, @sherlock)
    end
    it "a user can delete themselves" do
      expect(subject).to permit(@watson, @watson)
    end
  end

  permissions :create? do
    it "a logged in user cannot create another user" do
      expect(subject).not_to permit(@watson, @sherlock)
    end
    it "a new user can create a user" do
      expect(subject).to permit(nil)
    end
  end
end
