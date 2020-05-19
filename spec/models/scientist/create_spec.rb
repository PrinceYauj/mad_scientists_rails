# frozen_string_literal: true

RSpec.describe Scientist do
  it { expect(described_class).to respond_to(:create!).with(1).argument }

  describe '.create!' do
    subject(:create!) { described_class.create!(params) }

    context 'with valid parameters' do
      let(:params) { { madness: 1, attempts: 1 } }

      it { expect { create! }.to change(described_class, :count).by(1) }
    end

    context 'with id' do
      let(:params) { { id: 1, madness: 1, attempts: 1 } }

      it { expect { create! }.to change(described_class, :count).by(1) }
    end

    context 'with negative madness' do
      let(:params) { { madness: -1, attempts: 1 } }

      it { expect { create! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with negative attempts' do
      let(:params) { { madness: 1, attempts: -1 } }

      it { expect { create! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with not unique id' do
      let(:params) { { id: 1, madness: 1, attempts: 1 } }

      it 'raises ActiveRecord::RecordNotUnique error' do
        described_class.create!(params)
        expect { create! }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
