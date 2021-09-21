require "spec_helper"
require "rails_helper"

describe TagPolicy do
  subject { TagPolicy }

  before(:each) do
    @tony = User.create(username: "TonySoprano", password: "password")
    @junior = User.create(username: "JuniorSoprano", password: "password")
    @tag = @tony.tags.create(name: "outdoors")
    @jtag = @junior.tags.create(name: "indoors")
  end

  permissions :index? do
    it "shows a user's tags to themselves" do
      expect(subject).to permit(@tony.id, @tony.id)
    end
    it "only shows a user's tags to themselves" do
      expect(subject).not_to permit(@junior.id, @tony.id)
    end
  end

  permissions :create? do
    it "a user can create tags for themselves" do
      expect(subject).to permit(@junior, @junior.id)
    end
    it "a user can only create tags for themselves" do
      expect(subject).not_to permit(@junior, @tony.id)
    end
  end

  permissions :show? do
    it "a user can see their own tags" do
      expect(subject).to permit(@junior, @jtag)
    end
    it "a user can only see their own tags" do
      expect(subject).not_to permit(@junior, @tag)
    end
  end

  permissions :destroy? do
    it "a user can delete their own tags" do
      expect(subject).to permit(@junior, @jtag)
    end
    it "a user cannot delete another's tags" do
      expect(subject).not_to permit(@junior, @tag)
    end
  end

  permissions :add? do
    it "a user can only add their own tags to images" do
      expect(subject).not_to permit(@junior, @tag)
    end
    it "a user can only add tags to their own images" do
      expect(subject).not_to permit(@junior, @tag)
    end
  end

  permissions :remove? do
    it "a user can only remove their own tags to images" do
      expect(subject).not_to permit(@junior, @tag)
    end
    it "a user can only remove tags to their own images" do
      expect(subject).not_to permit(@junior, @tag)
    end
  end
end
