# frozen_string_literal: true

RSpec.describe Invention do
  it { is_expected.to respond_to(:update!).with(1).argument }

  describe '.update!' do
    subject(:update!) { instance.update!(params) }

    let(:instance) { create(:invention, id: 1) }
    let(:scientist) { create(:scientist) }

    context 'with valid id' do
      let(:params) { { id: -1 } }

      it 'updates the invention id' do
        update!
        expect(instance.id).to be == -1
      end
    end

    context 'with nil id' do
      let(:params) { { id: nil } }

      it { expect { update! }.to raise_error(ActiveRecord::NotNullViolation) }
    end

    context 'with not numeric id' do
      let(:params) { { id: 'a' } }

      it { expect { update! }.to change(instance, :id).from(1).to(0) }
    end

    context 'with not unique id' do
      let(:params) { { id: -2 } }

      it 'raises ActiveRecord::RecordNotUnique error' do
        create(:invention, id: -2)
        expect { update! }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end

    context 'with valid name' do
      let(:params) { { name: 'b' } }

      it 'updates the invention name' do
        expect { update! }.to change(instance, :name).from('a').to('b')
      end
    end

    context 'with invalid name' do
      let(:params) { { name: '' } }

      it { expect { update! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with valid power' do
      let(:params) { { power: 9001 } }

      it { expect { update! }.to change(instance, :power).by(9000) }
    end

    context 'with invalid power' do
      let(:params) { { power: -1 } }

      it { expect { update! }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'with valid scientist_id' do
      let(:params) { { scientist_id: scientist.id } }

      it { expect { update! }.to change(instance, :scientist_id).by(1) }
    end

    context 'with invalid scientist_id' do
      let(:params) { { scientist_id: scientist.id + 1 } }

      it { expect { update! }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
