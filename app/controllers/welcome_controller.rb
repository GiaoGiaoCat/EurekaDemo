class WelcomeController < ApplicationController
  def health
    render json: { "description": "Spring Cloud Eureka Discovery Client", "status": "UP" }
  end

  def info
    render json: { "author": "Victor Wang", "language": "Ruby" }
  end
end
