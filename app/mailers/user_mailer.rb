class UserMailer < ApplicationMailer
  default from: 'warsztaty@infakt.pl'

  def confirm_take(user, book)
    @user = user
    @book = book

    mail(to: @user.email, subject: "Wypożyczono książkę")
  end

  def book_return_remind(book)
    @book = book
    @reservation = book.taken_reservation
    return unless @reservation
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}")
  end

  def book_reserved_return(book)
    @book = book
    @reservation = book.reserved_reservations.last
    return unless @reservation
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}")
  end
end
