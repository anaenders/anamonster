class ContactController < ApplicationController

  before_filter :set_section
  
  def index
    if request.post?
      @contact = Contact.new(params[:contact])
      if @contact.valid?
        Mailer.contact(@contact)
        render :update do |page|
          page << "$('#error').fadeOut(function() {
            $('.message').hide();
            $('#contact_message').hide();
            $('#success').fadeIn();
          })"
        end
      else
        render :update do |page|
          page << "$('#error').html('#{@contact.error_message}')"
          page << "$('#success').fadeOut(function() {
            $('.message').hide();
            $('#contact_message').hide();
            $('#error').fadeIn();
          })"
        end
      end
    end
  end
  
  protected
  def set_section
    set_current_section(:contact)
  end

end
