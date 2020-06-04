# frozen_string_literal: true

RSpec.describe 'GET /scientists', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get '/scientists' }

  it 'invokes Byg::Rest::Scientists.index action' do
    expect(Byg::Rest::Scientists).to receive(:index)
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
