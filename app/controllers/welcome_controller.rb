class WelcomeController < ApplicationController
  def index
    redirect_to proponents_path
  end
end
