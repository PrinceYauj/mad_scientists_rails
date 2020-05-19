# frozen_string_literal: true

RSpec.describe Invention do
  it { is_expected.to respond_to(:destroy!).with(0).arguments }

  describe '.destroy!' do
    subject(:destroy!) { instance.destroy! }

    let(:instance) { create(:invention) }

    it 'destroys specified invention' do
      destroy!
      expect { described_class.find(instance.id) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
