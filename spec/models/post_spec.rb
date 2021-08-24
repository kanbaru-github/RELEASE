require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    # describe:テストのグループ
    subject { post.valid? }

    let(:customer) { create(:customer) }
    let!(:post) { build(:post, customer_id: customer.id) }

    context 'textカラム' do
      # context:テストをまとめている
      it '空欄でないこと' do
        # it:テストと具体的な内容を記述する
        post.text = ''
        is_expected.to eq false
        # expect:（）内に期待値を記述する
        # to:期待している値が「~であること」を意味している。(逆の場合はnot_toを使用)
        # eq:eqに続く値と、expectの期待値が同値であるかを判定しています'
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end

end
