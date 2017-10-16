class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = Application.all
  end

  def show
    @registered_application = Application.find(params[:id])
  end

  def new
    @user = current_user
    @registered_application = Application.new
  end

  def create
    @registered_application      = Application.new
    @registered_application.name = params[:application][:name]
    @registered_application.url  = params[:application][:url]
    @user                        = current_user
    @registered_application.user = @user

    if @registered_application.save
      redirect_to @registered_application, notice: "Registered Application was saved successfully."
    else
      flash.now[:alert] = "Error Registering Application. Please try again."
      render :new
    end
  end

  def edit
    @user = current_user
    @registered_application = Application.find(params[:id])
  end

  def update
    @registered_application = Application.find(params[:id])

    @registered_application.name = params[:application][:name]
    @registered_application.url  = params[:application][:url]
    @user                        = current_user
    @registered_application.user = @user

    if @registered_application.save
      redirect_to @registered_application, notice: "Registered Application was updated successfully."
    else
      flash.now[:alert] = "Error updating Registering Application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = Application.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end
end
