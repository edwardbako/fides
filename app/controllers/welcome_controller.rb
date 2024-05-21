class WelcomeController < ApplicationController
  def index
    logger.info "  Current host is:  #{request.base_url}"
  end

end