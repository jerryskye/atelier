require 'rails_helper'

RSpec.describe 'routes to the books', type: :routing do
  it { expect(get: '/google-isbn').to route_to('google_books#show') }
  it { expect(get: '/books').to route_to('books#index') }
  it { expect(post: '/books').to route_to('books#create') }
  it { expect(get: '/books/new').to route_to('books#new') }
  it { expect(get: '/books/1').to route_to('books#show', id: '1') }
  it { expect(get: '/books/1/edit').to route_to('books#edit', id: '1') }
  it { expect(patch: '/books/1').not_to route_to('books#update', id: '1') }
  it { expect(put: '/books/1').not_to route_to('books#update', id: '1') }
  it { expect(delete: '/books/1').not_to route_to('books#destroy', id: '1') }
end


