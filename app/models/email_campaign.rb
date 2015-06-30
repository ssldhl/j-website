# == Schema Information
#
# Table name: email_campaigns
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmailCampaign < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.add_email_to_website_campaign(email)

    gb = Gibbon::API.new

    result = gb.lists.subscribe({:id => "5fd8f6ff1a", :email => {:email => email}, :double_optin => false})

    rescue Gibbon::MailChimpError => e
    return e

  end
end
