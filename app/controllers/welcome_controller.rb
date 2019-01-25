class WelcomeController < ApplicationController
  def info
    render json: { "author": "Victor Wang", "language": "Ruby" }
  end
end
