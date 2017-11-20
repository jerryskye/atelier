class BookNotifierWorker
  include Sidekiq::Worker

  def perform(book_id)
    book = Book.find(book_id)
    UserMailer.book_return_remind(book).deliver
    UserMailer.book_reserved_return(book).deliver
  end
end
