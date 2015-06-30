class StaticPagesController < ApplicationController
  def home

  end

  def about
  end

  def career
  end

  def countdown
    @estimatedTime = "11 April 2014 09:46:35 UTC"
  end

  def emailCampaign
    message = EmailCampaign.add_email_to_website_campaign params[:email]
    render json: message
  end
end
