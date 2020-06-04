# frozen_string_literal: true

RSpec.describe 'other routes', type: :routing do
  it { expect(get: root_path).to route_to('scientists#start') }

  it 'all other paths routes to application#not_found' do
    expect(get('/*path')).to route_to('application#not_found',
                                      { 'path' => '*path' })
  end
end
