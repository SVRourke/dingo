require 'rails_helper'

RSpec.describe Image, type: :model do
  it "creates a valid image" do
    puts User.first
    image = Image.create
  end
  # pending "add some examples to check attached file #{__FILE__}"
end
