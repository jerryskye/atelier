Rails.application.routes.draw do

  devise_for :users

  root to: "books#index"

  get 'books/:book_id/reserve', to: 'reservations#reserve', as: 'reserve_book'
  get 'books/:book_id/take', to: 'reservations#take', as: 'take_book'
  get 'books/:book_id/give_back', to: 'reservations#give_back', as: 'give_back_book'
  get 'books/:book_id/cancel_reservation', to: 'reservations#cancel', as: 'cancel_book_reservation'
  get 'users/:user_id/reservations', to: 'reservations#users_reservations', as: 'users_reservations'
  get 'google-isbn', to: 'google_books#show'

  resources :books
end

#                  Prefix Verb   URI Pattern                                  Controller#Action
#        new_user_session GET    /users/sign_in(.:format)                     devise/sessions#new
#            user_session POST   /users/sign_in(.:format)                     devise/sessions#create
#    destroy_user_session DELETE /users/sign_out(.:format)                    devise/sessions#destroy
#       new_user_password GET    /users/password/new(.:format)                devise/passwords#new
#      edit_user_password GET    /users/password/edit(.:format)               devise/passwords#edit
#           user_password PATCH  /users/password(.:format)                    devise/passwords#update
#                         PUT    /users/password(.:format)                    devise/passwords#update
#                         POST   /users/password(.:format)                    devise/passwords#create
#cancel_user_registration GET    /users/cancel(.:format)                      devise/registrations#cancel
#   new_user_registration GET    /users/sign_up(.:format)                     devise/registrations#new
#  edit_user_registration GET    /users/edit(.:format)                        devise/registrations#edit
#       user_registration PATCH  /users(.:format)                             devise/registrations#update
#                         PUT    /users(.:format)                             devise/registrations#update
#                         DELETE /users(.:format)                             devise/registrations#destroy
#                         POST   /users(.:format)                             devise/registrations#create
#                    root GET    /                                            books#index
#            reserve_book GET    /books/:book_id/reserve(.:format)            reservations#reserve
#               take_book GET    /books/:book_id/take(.:format)               reservations#take
#          give_back_book GET    /books/:book_id/give_back(.:format)          reservations#give_back
# cancel_book_reservation GET    /books/:book_id/cancel_reservation(.:format) reservations#cancel
#      users_reservations GET    /users/:user_id/reservations(.:format)       reservations#users_reservations
#             google_isbn GET    /google-isbn(.:format)                       google_books#show
#                   books GET    /books(.:format)                             books#index
#                         POST   /books(.:format)                             books#create
#                new_book GET    /books/new(.:format)                         books#new
#               edit_book GET    /books/:id/edit(.:format)                    books#edit
#                    book GET    /books/:id(.:format)                         books#show
#                         PATCH  /books/:id(.:format)                         books#update
#                         PUT    /books/:id(.:format)                         books#update
#                         DELETE /books/:id(.:format)                         books#destroy
