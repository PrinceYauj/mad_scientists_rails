# frozen_string_literal: true

RSpec.describe 'POST /scientists', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { post '/scientists', params: { scientist: { a: 1 } } }

  it 'invokes Byg::Rest::Scientists.create action and redirects' do
    expect(Byg::Rest::Scientists).to receive(:create)
    http_request
  end

  it 'returns 302 status' do
    http_request
    expect(response.status).to be == 302
  end

  it 'redirects to created scientist and returns 200 status' do
    http_request
    expect(response).to redirect_to(scientist_path(Scientist.last.id))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.status).to be == 200
  end
end
