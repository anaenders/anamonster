class Contact
  attr_accessor :name, :email, :message
  
  def initialize(params = {})
    @name    = params[:name]
    @email   = params[:email]
    @message = params[:message]
  end
  
  def valid?
    if @name.blank?
      @error_message = 'Please enter your name.'
      return false
    end
    
    if !@email.blank? && !@email.match(Authentication.email_regex)
      @error_message = 'Your email is not in a valid format.'
      return false
    end
    
    if @message.blank?
      @error_message = 'Please enter your message.'
      return false
    end
    
    true
  end
  
  def error_message
    @error_message
  end
end