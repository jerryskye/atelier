module BooksHelper
end


# <% if book.can_be_taken?(current_user) %>
#   <%= link_to('Take', take_book_path(book_id: book.id), class: 'btn') %>
# <% elsif book.can_be_given_back?(current_user) %>
#   <%= link_to('Give back', give_back_book_path(book_id: book.id), class: 'btn') %>
# <% elsif book.can_reserve?(current_user) %>
#   <%= link_to('Make reservation', reserve_book_path(book_id: book.id), class: 'btn') %>
# <% else %>
#   <%= link_to('Cancel reservation', cancel_book_reservation_path(book_id: book.id), class: 'btn') %>
# <% end %>
