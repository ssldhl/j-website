class UserMailer < ActionMailer::Base
  default from: "do-not-reply@jhupro.com"
  def contact_email(contact)
    @contact = contact
    mail(to: ENV["EMAIL_USERNAME"], from: @contact.email, :subject => "Website Contact")
  end
end
