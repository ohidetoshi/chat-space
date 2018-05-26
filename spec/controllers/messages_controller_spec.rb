require 'rails_helper'

describe MessagesController do
#  letを利用してテスト中使用するインスタンスを定義
  let(:group) { create(:group) }
  let(:user) { create(:user) }


# メッセージ一覧を表示するアクション
  describe '#index' do
    # ログインしてる場合
    context 'log in' do
      before do     #各exampleが実行される直前に毎回実行される
        login user       #ログインする controller_macros内で定義
        get :index, params: { group_id: group.id }    #擬似的にindexアクションを動かすリクエストをする
      end
      # アクション内で定義しているインスタンス変数があるか
      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end
      # アクション内で定義しているインスタンス変数があるか
      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end
      # 該当するビューが描画されているか
      it 'redners index' do
        expect(response).to render_template :index
      end
    end

    #ログインしてない場合
    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end
      # 意図したビューにリダイレクトできているか
      it 'redirects to new_user_session_path' do
      expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

# メッセージを作成するアクションでテスト
  describe '#create' do
    let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }
    # ログインしている時
    context 'log in' do
      before do
        login user
      end
      # 保存に成功した場合
      context 'can save'
        # メッセージの保存ができてた
        subject {           #定義する理由はexpectの引数が長くなってしまうため
           post :create,
           params: params
         }
        it 'count up message' do
           expect{ subject }.to change(Message, :count).by(1)
        end
        # 意図した画面に遷移しているか
        it 'redirects to group_messages_path' do
          subject
          expect(response).to redirect_to(group_messages_path(group))
        end

      # 保存に失敗した場合
      context 'can not save' do
      # この中にメッセージの保存に失敗した場合のテストを記述
        # invalid_paramsを引数で渡すことで、意図的にメッセージの保存に失敗することを再現
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }
        # メッセージの保存に失敗
        subject {
          post :create,
          params: invalid_params
        }
        it 'does not count up' do
           expect{ subject }.not_to change(Message, :count)
        end

        # 意図した画面に遷移しているかindexに戻る
        it 'renders index' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    # ログインしてない時
    context 'not log in' do
      # 意図した画面に戻ってるか・・ログイン画面へ
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
