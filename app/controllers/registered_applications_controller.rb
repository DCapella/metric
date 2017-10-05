class RegisteredApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
