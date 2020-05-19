# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invention do
  it { is_expected.to be_an(ApplicationRecord) }

  it 'has parameters' do
    expect(described_class.new).to respond_to(:id, :scientist_id, :name, :power,
                                              :created_at, :updated_at)
  end
end
