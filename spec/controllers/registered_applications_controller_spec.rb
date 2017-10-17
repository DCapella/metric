require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_app) { create(:application, user: user) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_app to @registered_applications" do
      get :index
      expect(assigns(:registered_applications)).to eq([my_app])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_app.id}
      expect(response).to render_template :show
    end

    it "assigns my_app to @registered_application" do
      get :show, {id: my_app.id}
      expect(assigns(:registered_application)).to eq(my_app)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "initialize @registered_application" do
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of registered applications by 1" do
      expect{ post :create, {application: {name: 'New Application', url: 'http://www.newapplication.com', user: user}}}.to change(Application,:count).by(1)
    end

    it "assigns Application.last to @registered_application" do
      post :create, {application: {name: 'New Application', url: 'http://www.newapplication.com', user: user}}
      expect(assigns(:registered_application)).to eq Application.last
    end

    it "redirects to the new application" do
      post :create, {application: {name: 'New Application', url: 'http://www.newapplication.com', user: user}}
      expect(response).to redirect_to Application.last
    end
  end
end
