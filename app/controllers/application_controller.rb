class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include TwitterHelper
  
  helper :all
  
  protect_from_forgery # :secret => '69040ec1df2d2874be7fd1802ffbea73'

  def set_current_section(section_name)
    @current_section = section_name
  end

end
