# frozen_string_literal: true

RSpec.describe Invention do
  it { expect(described_class).to respond_to(:create!).with(1).argument }

  describe '.create!' do
    subject(:create!) { described_class.create!(params) }

    let!(:scientist) { Scientist.create!(madness: 1, attempts: 1) }

    context 'with valid parameters' do
      let(:params) { { name: 'a', power: 1, scientist_id: scientist.id } }

      it { expect { create! }.to change(described_class, :count).by(1) }
    end

    context 'with id' do
      let(:params) do
        { id: 1, name: 'a', power: 1, scientist_id: scientist.id }
      end

      it { expect { create! }.to change(described_class, :count).by(1) }
    end

    context 'with blank name' do
      let(:params) { { name: ' ', power: 1, scientist_id: scientist.id } }

      it { expect { create! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with name too long' do
      let(:params) { { name: 'a' * 256, power: 1, scientist_id: scientist.id } }

      it { expect { create! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with negative power' do
      let(:params) { { name: 'a', power: -1, scientist_id: scientist.id } }

      it { expect { create! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with invalid scientist_id' do
      let(:params) do
        { name: 'a', power: 1, scientist_id: Scientist.last.id + 1 }
      end

      it { expect { create! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with not unique id' do
      let(:params) do
        { name: 'a', power: 1, scientist_id: scientist.id, id: 1 }
      end

      it 'raises ActiveRecord::RecordNotUnique error' do
        described_class.create!(params)
        expect { create! }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
