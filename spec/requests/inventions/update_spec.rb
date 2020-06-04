# frozen_string_literal: true

RSpec.describe 'PUT /inventions/id', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) do
    put "/inventions/#{invention.id}", params: { invention: { a: 1 } }
  end

  let(:invention) { create(:invention) }

  it 'invokes Byg::Rest::Inventions.update action and redirects' do
    expect(Byg::Rest::Inventions).to receive(:update)
    http_request
  end

  it 'returns 302 status' do
    http_request
    expect(response.status).to be == 302
  end

  it 'redirects to updated invention and returns 200 status' do
    http_request
    expect(response).to redirect_to(invention_path(invention.id))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.status).to be == 200
  end
end
