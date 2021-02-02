require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'userが登録できる時' do
    it '全ての項目が入力されていると登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'userが登録できない時' do
    it 'nameが空だと登録できない' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'status_idが空だと登録できない' do
      @user.status_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Status can't be blank")
    end
    it 'group_idが空だと登録できない' do
      @user.group_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Group can't be blank")
    end
    it 'status_idが1だと登録できない' do
      @user.status_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Status must be other than 1")
    end
    it 'group_idが1だと登録できない' do
      @user.group_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Group must be other than 1")
    end
    it 'emailが重複している時' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = 'A1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationは等しくないと登録できない' do
      @user.password = 'A12345'
      @user.password_confirmation = 'A123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
