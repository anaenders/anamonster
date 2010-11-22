class Contact
  attr_accessor :name, :email, :message
  
  def initialize(params = {})
    @name    = params[:name]
    @email   = params[:email]
    @message = params[:message]
  end
  
  def valid?
    if @name.blank?
      @error_message = 'Oops, you didn&#8217;t enter your name.<br />Try again please! <span>click here</span>!'
      return false
    end
    
    if !@email.blank? && !@email.match(Authentication.email_regex)
      @error_message = 'Looks like your email is not in a valid format.<br />Try again please! <span>click here</span>!'
      return false
    end
    
    if @message.blank?
      @error_message = 'Oops, you didn&#8217;t enter a message.<br />Try again please! <span>click here</span>!'
      return false
    end
    
    true
  end
  
  def error_message
    @error_message
  end
end