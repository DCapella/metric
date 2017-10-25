class ApplicationController < ActionController::Base
  # comment out for testing
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
end
