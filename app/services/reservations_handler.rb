class ReservationsHandler

  def initialize(user)
    @user = user
  end

  def take(book)
    return "book is not available for reservation" unless book.can_be_taken?(user)

    if book.available_reservation.present?
      reservation = book.available_reservation
      reservation.update_attributes(status: 'TAKEN')
    else
      reservation = book.reservations.create(user: user, status: 'TAKEN')
    end
    UserMailer.confirm_take(user, book).deliver_now
    BookNotifierWorker.perform_at(reservation.expires_at - 1.day, reservation.book_id)
    notify_user_calendar(reservation)
  end

  def give_back(book)
    if GivenBackPolicy.new(user: user, book: book).applies?
      reservation = book.taken_reservation
      ActiveRecord::Base.transaction do
        reservation.update_attributes(status: 'RETURNED')
        book.next_in_queue.update_attributes(status: 'AVAILABLE') if book.next_in_queue.present?
      end
      notify_user_calendar(reservation)
    end
  end

  def reserve(book)
    if book.can_be_reserved?(user)
      book.reservations.create(user: user, status: 'RESERVED')
    end
  end

  def cancel_reservation(book)
    book.reserved_reservations.order(created_at: :asc).first.update_attributes(status: 'CANCELED')
  end

  private
  attr_reader :user

  def notify_user_calendar(reservation)
    UserCalendarNotifier.new(reservation.user).perform(reservation)
  end
end
