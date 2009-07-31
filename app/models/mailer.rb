class Mailer < ActionMailer::Base
  def contact(contact)
    recipients 'ana.carter@alumni.cmu.edu'
    from       'contact@anamonster.com'
    subject    "anamonster Contact from #{contact.name}"
    body       :contact => contact
  end
end
