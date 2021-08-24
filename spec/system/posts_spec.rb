require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    context 'emailカラム' do
      it '空欄でないこと' do
        customer.email = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        customer.email = other_customer.email
        is_expected.to eq false
      end
    end

  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end