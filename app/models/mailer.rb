class Mailer < ActionMailer::Base
  def contact(contact)
    recipients 'aecarter@gmail.com'
    from       'contact@anamonster.com'
    subject    "anamonster Contact from #{contact.name}"
    body       :contact => contact
  end
end
