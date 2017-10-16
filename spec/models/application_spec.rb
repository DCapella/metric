require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:user) { create(:user) }
  let(:app) { create(:application, user: user) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has a name and url attribute" do
      expect(app).to have_attributes(name: "New Application", url: "http://www.website.com")
    end
  end
end
