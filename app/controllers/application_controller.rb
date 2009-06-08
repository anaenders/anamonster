class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all
  
  protect_from_forgery # :secret => '69040ec1df2d2874be7fd1802ffbea73'

end
