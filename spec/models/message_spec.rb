require 'rails_helper'

# messageクラスにあるcreateメソッドをテスト
describe Message, type: :model do
  describe '#create' do

    context 'can save' do     # メッセージを保存できた時
      #メッセージがあれば保存できる
      it "is valid with content" do
        expect(build(:message, image: nil)).to be_valid
      end
      #画像があれば保存できる
      it "is valid with image" do
        expect(build(:message, content: nil)).to be_valid
      end
      #メッセージと画像があれば保存できる
      it "is valid with content and image" do
        expect(build(:message)).to be_valid
      end
    end

    context 'can not save' do     # メッセージを保存できない場合
      # メッセージも画像も無いと保存できない
      it 'is invalid without content and image' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include('を入力してください')
      end
      # group_idが無いと保存できない
      it 'is invalid without content and image' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end
      # user_idが無いと保存できない
      it 'is invalid without content and image' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end
    end
  end
end
