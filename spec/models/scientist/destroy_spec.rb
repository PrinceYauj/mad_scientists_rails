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
      let!(:instance) { create(:scientist, :with_inventions) }

      it 'destroys scientists inventions ' do
        expect(Invention.count).to be == 2
        destroy!
        expect(Invention.count).to be == 0
      end

      it 'destroys scientist' do
        destroy!
        expect { described_class.find(instance.id) }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
