class UserMailer < ApplicationMailer
  default from: 'warsztaty@infakt.pl'
  #layout 'mailer'

  def confirm_take(user, book)
    @user = user
    @book = book

    mail(to: @user.email, subject: "Wypożyczono książkę")
  end
end
