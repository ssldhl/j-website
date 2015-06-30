class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      @contact.update_spreadsheet
      UserMailer.contact_email(@contact).deliver
      @message = "Thank you #{@contact.name} for contacting us. We will get back to you shortly."
      respond_to do |format|
        format.html {
          flash[:notice]=@message
          redirect_to root_path
        }
        format.js
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.js
      end
    end
  end
end
