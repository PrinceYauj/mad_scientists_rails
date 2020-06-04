# frozen_string_literal: true

RSpec.describe 'POST /inventions', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) do
    post '/inventions', params: { invention:
                                  { scientist_id: scientist.id }
                                }
  end

  let(:scientist) { create(:scientist) }

  it 'invokes Byg::Rest::Inventions.create action and redirects' do
    expect(Byg::Rest::Inventions).to receive(:create)
    http_request
  end

  it 'returns 302 status' do
    http_request
    expect(response.status).to be == 302
  end

  it 'redirects to created invention and returns 200 status' do
    http_request
    expect(response).to redirect_to(invention_path(Invention.last.id))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.status).to be == 200
  end
end
