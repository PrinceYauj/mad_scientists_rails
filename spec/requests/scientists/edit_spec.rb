# frozen_string_literal: true

RSpec.describe 'GET /scientists/:id/edit', type: :request do
  # https://github.com/turbolinks/turbolinks-rails/issues/38
  subject(:http_request) { get "/scientists/#{scientist.id}/edit" }

  let(:scientist) { create(:scientist) }

  before do
    http_request
  end

  it { expect(response).to render_template(:edit) }
  it { expect(response.status).to be == 200 }
end
