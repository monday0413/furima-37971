require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
      before do
        @order = FactoryBot.build(:order_form)
      end

      
      context '商品購入ができる場合' do
        it "全ての内容に問題がなければ購入ができること"  do
          expect(@order).to be_valid
        end
          it '建物名がなくても購入できる' do
            @order.building_name = ''
            expect(@order).to be_valid
          end
        end

        context '商品購入ができない場合' do
          # it "tokenが空では登録できないこと" do
          #   @order.token = 
          #   @order.valid?
          #   expect(@order.errors.full_messages).to include("Token can't be blank")
          # end
          it '郵便番号が空では購入できないこと' do
            @order.post_code = ''
            @order.valid?
            expect(@order.errors.full_messages).to include("Post code can't be blank")
          end
          it '郵便番号が「3桁ハイフン4桁」でなければ購入できない' do
            @order.post_code = '1234567'
            @order.valid?
            expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
          end
          it '郵便番号が半角文字列でなければ購入できない' do
            @order.post_code = '１２３-４５６７'
            @order.valid?           
            expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
          end
          it '県が1では購入できない' do
            @order.prefecture_id = 1
            @order.valid?
            expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
          end
          it '市町村が空では購入できないこと' do
            @order.city = ''
            @order.valid?
            expect(@order.errors.full_messages).to include("City can't be blank")

          end
          it '番地が空では購入できないこと' do
            @order.address_number = ''
            @order.valid?
            expect(@order.errors.full_messages).to include("Address number can't be blank")
          end
          it '電話番号が空では購入できないこと' do
            @order.phone_number = ''
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number can't be blank")
          end
          it '電話番号は、半角じゃないと購入できない' do
            @order.phone_number = '０９０１１１１２２２２'
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number is invalid")
          end
          it '電話番号は、9桁以下では購入できない' do
            @order.phone_number = '123456789'
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number is invalid")
          end
          it '電話番号は、12桁以上では購入できない' do
            @order.phone_number = '123456789012'
            @order.valid?
            expect(@order.errors.full_messages).to include("Phone number is invalid")
          end

      end
   end
end