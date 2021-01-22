require 'rails_helper'

RSpec.describe Gourmet, type: :model do
  before do
    @gourmet = FactoryBot.build(:gourmet)
  end 
  
  describe 'グルメレビュー投稿' do
    context 'グルメレビュー投稿がうまくいくとき' do
      it 'すべての値が存在すれば登録できること' do
        expect(@gourmet).to be_valid
      end
    end
    
    context 'グルメレビュー投稿がうまくいかないとき' do
      it 'タイトルが空では登録できないこと' do
        @gourmet.name = ""
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'genre_idが空では登録できないこと' do
        @gourmet.genre_id = ""
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("Genreを入力してください", "Genreは数値で入力してください")
      end
      it 'genre_idが0では登録できないこと' do
        @gourmet.genre_id = 0
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("Genreは0以外の値にしてください")
      end
      it 'area_idが空では登録できないこと' do
        @gourmet.area_id = ""
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("Areaを入力してください", "Areaは数値で入力してください")
      end
      it 'area_idが0では登録できないこと' do
        @gourmet.area_id = 0
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("Areaは0以外の値にしてください")
      end
      it 'メニューが空では登録できないこと' do
        @gourmet.menu = ""
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("メニューを入力してください")
      end
      it '特徴が空では登録できないこと' do
        @gourmet.feature = ""
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("特徴を入力してください")
      end
      it '内容が空では登録できないこと' do
        @gourmet.content = ""
        @gourmet.valid?
        expect(@gourmet.errors.full_messages).to include("内容を入力してください")        
      end
    end  
  end  
end
