require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmaton、en_familyとen_first、kana_familyとkana_first、birthが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'en_familyが空では登録できない' do
      @user.en_family = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("En family can't be blank")
    end
    it 'en_firstが空では登録できない' do
      @user.en_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("En first can't be blank")
    end
    it 'kana_familyが空では登録できない' do
      @user.kana_family = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family can't be blank")
    end
    it 'kana_firstが空では登録できない' do
      @user.kana_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first can't be blank")
    end
    it 'birthが空では登録できない' do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailに@が存在しない場合は登録できない' do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'en_familyが全角(漢字・ひらがな・カタカナ)で入力されていない場合は入力できない' do
      @user.en_family = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("En family is invalid")
    end
    it 'en_firstが全角(漢字・ひらがな・カタカナ)で入力されていない場合は入力できない' do
      @user.en_first = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("En first is invalid")
    end
    it 'kana_familyが全角(カタカナ)で入力されていない場合は登録できない' do
      @user.kana_family = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family is invalid")
    end
    it 'kana_firstが全角(カタカナ)で入力されていない場合は登録できない' do
      @user.kana_first = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
  end
end