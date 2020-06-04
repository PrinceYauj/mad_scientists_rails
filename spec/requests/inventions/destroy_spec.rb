# frozen_string_literal: true

RSpec.describe 'DELETE /inventions/:id', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { delete "/inventions/#{invention.id}" }

  let(:invention) { create(:invention) }

  it 'invokes Byg::Rest::Inventions.destroy and redirects to /inventions' do
    expect(Byg::Rest::Inventions).to receive(:destroy)
    http_request
  end

  it 'returns 302 status' do
    http_request
    expect(response.status).to be == 302
  end

  it 'redirects to /inventions and returns 200 status' do
    http_request
    expect(response).to redirect_to(inventions_path)
    follow_redirect!
    expect(response).to render_template(:index)
    expect(response.status).to be == 200
  end
end
