require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:user) { create(:user) }
  let(:app) { create(:application, user: user) }

  describe "attributes" do
    it "has a name and URL attribute" do
      expect(app).to have_attributes(name: "New Application", URL: "http://www.website.com")
    end
  end
end
