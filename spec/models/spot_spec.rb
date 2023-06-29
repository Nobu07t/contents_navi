require 'rails_helper'
RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe '聖地投稿機能' do

   context '聖地投稿できるとき' do
    it '全項目が存在すれば登録できる' do
      expect(@spot).to be_valid
    end
   end

    context '聖地投稿できないとき' do

      it '聖地画像が空では登録できない' do
        @spot.image = nil
        binding.pry
        @spot.valid?
        expect(@spot.errors.full_messages).to include "Image can't be blank"
      end

      it 'ユーザーのコメントが空では登録できない' do
        @spot.catch_copy = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include "Catch copy can't be blank"
      end

      it 'タイトルが空では登録できない' do
        @spot.title = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include "Title can't be blank"
      end
      

      it 'ジャンルの情報が「id: 1」では登録できない' do
        @spot.genre_id = "1"
        @spot.valid?
        expect(@spot.errors.full_messages).to include "Genre must be other than 1"
      end

      it '都道府県の情報が「id: 1」では登録できない' do
        @spot.prefecture_id = "1"
        @spot.valid?
        expect(@spot.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it '市名が空では登録できない' do
        @spot.city = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include "City copy can't be blank"
      end
      
      # it 'userが紐付いていなければ出品できない' do
      #   @spot.user = nil
      #   @spot.valid?
      #   expect(@spot.errors.full_messages).to include "User must exist"
      # end

   end
  end
end