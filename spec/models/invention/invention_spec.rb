require 'rails_helper'

RSpec.describe Invention do
  it { is_expected.to be_an(ApplicationRecord) }

  it 'has parameters' do
    is_expected.to respond_to(:id, :scientist_id, :name, :power, :created_at,
                              :updated_at, :scientist)
  end
end
