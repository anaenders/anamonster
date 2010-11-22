class Mailer < ActionMailer::Base
  
  def contact(contact)
    recipients 'aecarter@gmail.com'
    from       'contact@anamonster.com'
    subject    "anamonster contact from #{contact.name}"
    body       :contact => contact
  end
  
  def comment(comment)
    recipients 'aecarter@gmail.com'
    from       'blogpost@anamonster.com'
    subject    "anamonster blog post from #{comment.user_name}"
    body       :comment => comment
  end
  
end
