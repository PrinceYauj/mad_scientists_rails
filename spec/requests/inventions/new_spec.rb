# frozen_string_literal: true

RSpec.describe 'GET /inventions/new', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get '/inventions/new' }

  before do
    http_request
  end

  it { expect(response).to render_template(:new) }
  it { expect(response.status).to be == 200 }
end
