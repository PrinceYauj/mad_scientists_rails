# frozen_string_literal: true

RSpec.describe 'PUT /scientists/:id', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) do
    put "/scientists/#{scientist.id}", params: { scientist: { a: 1 } }
  end

  let(:scientist) { create(:scientist) }

  it 'invokes Byg::Rest::Scientists.update action and redirects' do
    expect(Byg::Rest::Scientists).to receive(:update)
    http_request
  end

  it 'returns 302 status' do
    http_request
    expect(response.status).to be == 302
  end

  it 'redirects to scientist and returns 200 status' do
    http_request
    expect(response).to redirect_to(scientist_path(scientist.id))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.status).to be == 200
  end
end
