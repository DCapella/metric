require 'rails_helper'


RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "attributes" do
    it "has an email attribute" do
      expect(user).to have_attributes(email: 'admin@admin.com')
    end
  end
end
