# frozen_string_literal: true

RSpec.describe 'GET /scientists/:id', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get "/scientists/#{scientist.id}" }

  let(:scientist) { create(:scientist) }

  it 'invokes Byg::Rest::Scientists.show action' do
    expect(Byg::Rest::Scientists).to receive(:show)
    http_request
  end

  it 'renders show view' do
    http_request
    expect(response).to render_template(:show)
  end

  it 'returns 200 status' do
    http_request
    expect(response.status).to be == 200
  end
end
