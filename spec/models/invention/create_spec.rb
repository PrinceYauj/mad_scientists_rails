require 'rails_helper'

RSpec.describe Invention do
  it { expect(described_class).to respond_to(:create).with(1).argument }

#  describe '.create' do
#  end
end
