class Contact
  attr_accessor :name, :email, :message
  
  def initialize(params = {})
    @name    = params[:name]
    @email   = params[:email]
    @message = params[:message]
  end
  
  def valid?
    if @name.blank?
      @error_message = 'Oops, you didn&apos;t enter your name.<br /><span>try again please! click here</span>!'
      return false
    end
    
    if !@email.blank? && !@email.match(Authentication.email_regex)
      @error_message = 'Looks like your email is not in a valid format.<br /><span>try again please! click here</span>!'
      return false
    end
    
    if @message.blank?
      @error_message = 'Oops, you didn&apos;t enter a message.<br /><span>click here and try again please</span>!'
      return false
    end
    
    true
  end
  
  def error_message
    @error_message
  end
end