require 'rails_helper'

RSpec.describe 'routes to the google books', type: :routing do
  it { expect(get: '/google-isbn').to route_to('google_books#show') }
  it { expect(get: '/google-isbn').to route_to('google_books#show') }
end
