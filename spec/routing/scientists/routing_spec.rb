# frozen_string_literal: true

RSpec.describe 'scientist resource routes', type: :routing do
  it { expect(get: scientists_path).to route_to('scientists#index') }
  it { expect(post: scientists_path).to route_to('scientists#create') }
  it { expect(get: new_scientist_path).to route_to('scientists#new') }

  it 'routes get /scientists/1/edit to scientists#edit action' do
    expect(get: edit_scientist_path(1)).to route_to('scientists#edit',
                                                    { id: '1' })
  end

  it 'routes get /scientists/1 to scientists#show action' do
    expect(get: scientist_path(1)).to route_to('scientists#show', { id: '1' })
  end

  it 'routes patch /scientists/1 to scientists#update action' do
    expect(patch: scientist_path(1)).to route_to('scientists#update',
                                                 { id: '1' })
  end

  it 'routes put /scientists/1 to scientists#update action' do
    expect(put: scientist_path(1)).to route_to('scientists#update', { id: '1' })
  end

  it 'routes delete /scientists/1 to scientists#destroy action' do
    expect(delete: scientist_path(1)).to route_to('scientists#destroy',
                                                  { id: '1' })
  end
end
