# frozen_string_literal: true

RSpec.describe 'GET /inventions', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get '/inventions' }

  it 'invokes Byg::Rest::Invention.index action' do
    expect(Byg::Rest::Inventions).to receive(:index)
    http_request
  end

  it 'renders index view' do
    http_request
    expect(response).to render_template(:index)
  end

  it 'returns 200 status' do
    http_request
    expect(response.status).to be == 200
  end
end
