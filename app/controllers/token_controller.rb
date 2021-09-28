class TokenController < ApplicationController
  before_action :process_token

  # GET /favorites
  def checkToken
    render status: 200
  end
end
