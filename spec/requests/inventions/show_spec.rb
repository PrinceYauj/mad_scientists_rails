# frozen_string_literal: true

RSpec.describe 'GET /inventions/:id', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get "/inventions/#{invention.id}" }

  let(:invention) { create(:invention) }

  it 'invokes Byg::Rest::Invention.show action' do
    expect(Byg::Rest::Inventions).to receive(:show)
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
