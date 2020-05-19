# frozen_string_literal: true

RSpec.describe Scientist do
  it { is_expected.to respond_to(:destroy!).with(0).arguments }

  describe '.destroy!' do
    subject(:destroy!) { instance.destroy! }

    context 'with no belonging inventions' do
      let(:instance) { create(:scientist) }

      it 'destroys scientist' do
        destroy!
        expect { described_class.find(instance.id) }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'with belonging inventions' do
      let(:instance) { create(:scientist, :with_inventions) }

      it { expect { destroy! }.to raise_error(ActiveRecord::InvalidForeignKey) }
    end
  end
end
