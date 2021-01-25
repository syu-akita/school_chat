require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    context 'messageが登録できる時' do
      it '全ての項目が入力されている時' do
        expect(@message).to be_valid
      end
      it 'contentが空の時でも登録できる' do
        @message.content = nil
        expect(@message).to be_valid
      end
      it 'imageが空でも登録できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end

    context 'messageが登録できない時' do
      it 'contentとimageが空であるとき' do
        @message.content = nil
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it 'roomが紐付いていない時' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it 'userが紐付いていない時' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end
