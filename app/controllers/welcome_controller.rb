class WelcomeController < ApplicationController

  protect_from_forgery with: :exception
  
  def index
    @clubs = Club.all
  end
end
