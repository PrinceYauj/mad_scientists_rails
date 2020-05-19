# frozen_string_literal: true

RSpec.describe Scientist do
  it { is_expected.to respond_to(:inventions).with_unlimited_arguments }

  describe '.inventions' do
    subject(:inventions) { instance.inventions }

    let(:instance) { create(:scientist, :with_inventions) }

    it { is_expected.to be_a(ActiveRecord::Associations::CollectionProxy) }
    it { is_expected.to all(be_an(Invention)) }

    it 'has invention of a scientist' do
      expect(inventions.map(&:scientist_id).uniq).to be == [instance.id]
    end
  end
end
