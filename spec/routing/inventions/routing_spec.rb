# frozen_string_literal: true

RSpec.describe 'invention resource routes', type: :routing do
  it { expect(get: inventions_path).to route_to('inventions#index') }
  it { expect(post: inventions_path).to route_to('inventions#create') }
  it { expect(get: new_invention_path).to route_to('inventions#new') }

  it 'routes get /inventions/1/edit to inventions#edit action' do
    expect(get: edit_invention_path(1)).to route_to('inventions#edit',
                                                    { id: '1' })
  end

  it 'routes get /inventions/1 to inventions#show action' do
    expect(get: invention_path(1)).to route_to('inventions#show', { id: '1' })
  end

  it 'routes patch /inventions/1 to inventions#update action' do
    expect(patch: invention_path(1)).to route_to('inventions#update',
                                                 { id: '1' })
  end

  it 'routes put /inventions/1 to inventions#update action' do
    expect(put: invention_path(1)).to route_to('inventions#update', { id: '1' })
  end

  it 'routes delete /inventions/1 to inventions#destroy action' do
    expect(delete: invention_path(1)).to route_to('inventions#destroy',
                                                  { id: '1' })
  end
end
