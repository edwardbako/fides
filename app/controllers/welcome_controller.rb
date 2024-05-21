class WelcomeController < ApplicationController
  def show
    logger.info "  Current host is:  #{request.base_url}"
    @domain = if params[:domain].present? 
      Domain.find_by(name: params[:domain]) 
    else
      nil
    end
  end

  def index
    @domains = Domain.all
  end

end