# frozen_string_literal: true

RSpec.describe 'DELETE /scientists/:id', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { delete "/scientists/#{scientist.id}" }

  let(:scientist) { create(:scientist) }

  it 'invokes Byg::Rest::Scientists.destroy and redirects' do
    expect(Byg::Rest::Scientists).to receive(:destroy)
    http_request
  end

  it 'returns 302 status' do
    http_request
    expect(response.status).to be == 302
  end

  it 'redirects to /scientists and returns 200 status' do
    http_request
    expect(response).to redirect_to(scientists_path)
    follow_redirect!
    expect(response).to render_template(:index)
    expect(response.status).to be == 200
  end
end
