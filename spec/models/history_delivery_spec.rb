require 'rails_helper'

RSpec.describe HistoryDelivery, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @history_delivery = FactoryBot.build(:history_delivery, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@history_delivery).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @history_delivery.building = ''
        expect(@history_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @history_delivery.postal_code = ''
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @history_delivery.postal_code = '1234567'
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @history_delivery.area_id = 1
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include('Area can`t be blank')
      end
      it 'cityが空だと保存できないこと' do
        @history_delivery.city = ''
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @history_delivery.address = ''
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @history_delivery.tel = ''
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @history_delivery.tel = '123'
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上では購入できない' do
        @history_delivery.tel = '012345678912'
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Tel is invalid")
      end
      it 'telに半角数字以外が含まれている場合は購入できない' do
        @history_delivery.tel = 'あ0123456789'
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Tel is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @history_delivery.token = ''
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと保存できないこと' do
        @history_delivery.user_id = nil
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @history_delivery.item_id = nil
        @history_delivery.valid?
        expect(@history_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
