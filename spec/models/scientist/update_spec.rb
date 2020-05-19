# frozen_string_literal: true

RSpec.describe Scientist do
  it { is_expected.to respond_to(:update!).with(1).argument }

  describe '.update!' do
    subject(:update!) { instance.update!(params) }

    let(:instance) { create(:scientist, :with_inventions) }

    context 'with valid id' do
      let(:params) { { id: -1 } }

      it 'raises an error if there are belonging inventions' do
        expect { update! }.to raise_error(ActiveRecord::InvalidForeignKey)
      end

      it 'updates the scientist id if there are no belonging inventions' do
        instance.inventions.delete_all
        update!
        expect(instance.id).to be == -1
      end
    end

    context 'with invalid id' do
      let(:params) { { id: nil } }

      it { expect { update! }.to raise_error(ActiveRecord::NotNullViolation) }
    end

    context 'with valid madness' do
      let(:params) { { madness: 2 } }

      it { expect { update! }.to change(instance, :madness).from(1).to(2) }
    end

    context 'with invalid madness' do
      let(:params) { { madness: -1 } }

      it { expect { update! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with valid attempts' do
      let(:params) { { attempts: 2 } }

      it { expect { update! }.to change(instance, :attempts).from(1).to(2) }
    end

    context 'with invalid attempts' do
      let(:params) { { attempts: -1 } }

      it { expect { update! }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
