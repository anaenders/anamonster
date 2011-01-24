class Mailer < ActionMailer::Base
  
  default :to => 'aecarter@gmail.com', :from => 'system@anamonster.com'
  
  def contact(contact)
    @contact = contact
    mail(:subject => "anamonster contact from #{contact.name}")
  end
  
  def comment(comment)
    @comment = comment
    mail(:subject => "anamonster blog post from #{comment.user_name}")
  end
  
end
