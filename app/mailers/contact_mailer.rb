class ContactMailer < ApplicationMailer

  def contact(post)
    @post = post
    mail(to: 'admin@webmaster.com', subject:'Subject of the mail')

  end

end
