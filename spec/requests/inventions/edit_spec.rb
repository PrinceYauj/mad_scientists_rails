# frozen_string_literal: true

RSpec.describe 'GET /inventions/:id/edit', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get "/inventions/#{invention.id}/edit" }

  let(:invention) { create(:invention) }

  before do
    http_request
  end

  it { expect(response).to render_template(:edit) }
  it { expect(response.status).to be == 200 }
end
