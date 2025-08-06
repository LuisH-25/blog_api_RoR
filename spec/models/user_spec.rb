require 'rails_helper'

RSpec.describe User, type: :model do
  it "valida la presencia de email, name y auth token" do
    should validate_presence_of(:email)
    should validate_presence_of(:name)
    should validate_presence_of(:auth_token)
  end

  it "valida las relaciones" do
    should have_many(:posts)
  end
end
