class AppealsController < ApplicationController
  before_action :set_recaptcha_site_key
  
  def new
    @appeal = Appeal.new
  end

  def create
    @appeal = Appeal.new(appeal_params)
    recaptcha!
    
    if (@success || @checkbox_success) && @appeal.save
      redirect_to @appeal
    else
      @show_checkbox_recaptcha = true unless @success
      render :new, status: :unprocessable_entity
    end
  
  end

  def show
    @appeal = Appeal.find(params[:id])
  end

  private

  def appeal_params
    params.require(:appeal).permit(:name, :email, :subject, :body, :submit).except(:submit)
  end

  def recaptcha!
    @success ||= verify_recaptcha(
      action: "contact",
      minimum_score: 0.5,
      secret_key: recaptcha_secret_key)
    @checkbox_success ||= verify_recaptcha(model: @appeal) unless @success
  end
  
  def recaptcha_secret_key
    Rails.application.credentials.dig(:recaptcha, :v3, :secret_key)
  end

  def set_recaptcha_site_key
    @recaptcha_site_key ||= Rails.application.credentials.dig(:recaptcha, :v3, :site_key)
  end
end