require 'rails_helper'

RSpec.describe Order, type: :model do



  before do
    @order = FactoryBot.build(:order)
  end

  context '商品購入ができる場合' do
    it "全ての内容に問題がなければ購入ができること"  do
      expect(@order).to be_valid
    end
    it '建物名がなくても購入できる' do

    end
  end

  context '商品購入ができない場合' do
    it "priceが空では保存ができないこと" do
      @order.post_code = ''
      @order.valid?
      binding.pry
      expect(@order.errors.full_messages).to include("PostCode can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '郵便番号が空では登録できないこと' do

    end
    it '郵便番号が「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do

    end
    it '都道府県が空では登録できないこと' do

    end
    it '市町村が空では登録できないこと' do

    end
    it '番地が空では登録できないこと' do

    end
    it '電話番号が空では登録できないこと' do

    end
    
    it '電話番号は、半角数値のみ保存可能なこと' do

    end
    it '電話番号は、10桁以上11桁以内のみ保存可能なこと' do

    end


    it '' do
    end

  end
end
