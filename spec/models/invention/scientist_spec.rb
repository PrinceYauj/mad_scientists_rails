# frozen_string_literal: true

RSpec.describe Invention do
  it { is_expected.to respond_to(:scientist).with_unlimited_arguments }

  describe '.scientist' do
    subject(:scientist) { instance.scientist }

    let(:instance) { create(:invention) }

    it { is_expected.to be_a(Scientist) }
    it { expect(scientist.id).to be == instance.scientist_id }
  end
end
