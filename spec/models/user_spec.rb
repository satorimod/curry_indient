require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームがない場合登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'Eメールがない場合登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'パスワードがない場合登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが存在してもパスワード（確認用）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワード（確認用）は不正な値です')
      end
      it 'ニックネームが11文字以上では登録できない' do
        @user.nickname = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは10文字以内で入力してください')
      end
      it '姓がない場合登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓を入力してください')
      end
      it '名がない場合登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください')
      end
      it '重複したEメールが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'Eメールに@が含まれていなければ登録できない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'curr1'
        @user.password_confirmation = 'curr1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが半角英語のみは登録できない' do
        @user.password = 'curryindia'
        @user.password_confirmation = 'curryindia'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です', 'パスワード（確認用）は不正な値です')
      end
      it 'パスワードが全角英数混合は登録できない' do
        @user.password = 'AIUEO１２３'
        @user.password_confirmation = 'AIUEO１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です', 'パスワード（確認用）は不正な値です')
      end
      it 'パスワードが数字のみは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です', 'パスワード（確認用）は不正な値です')
      end
      it '生年月日がない場合登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
