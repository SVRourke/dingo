require "spec_helper"
require "rails_helper"

describe ImagePolicy do
  subject { ImagePolicy }

  before(:each) do
    @tony = User.create(username: "TonySoprano", password: "password")
    @junior = User.create(username: "JuniorSoprano", password: "password")
    @image = @tony.images.create(caption: "money")
  end

  permissions :show? do
    it "denies access if a user did not upload" do
      expect(subject).not_to permit(@junior, @image)
    end
  end
  permissions :destroy? do
    it "only the uploader may delete an image" do
      expect(subject).not_to permit(@junior, @image)
    end
  end
  permissions :index? do
    it "a user can only view their own files" do
      expect(subject).not_to permit(@junior, @tony.images)
    end
  end
  permissions :create? do
    it "a user can only upload to their own account" do
      expect(subject).not_to permit(@junior, @tony)
    end
  end
end
