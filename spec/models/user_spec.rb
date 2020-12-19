require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'get_associated_objects' do
    let(:user) { FactoryBot.create(:user) }


    context "クラス名を渡すと、ユーザに紐づく当該クラスのデータ配列が返される" do
      context "本のタグ" do
        let!(:tags) { FactoryBot.create_list(:tag, 5, :for_book, user: user) }
        let!(:book_tags) { tags.map{ |t| t.becomes(BookTag) } }

        subject { user.get_associated_objects("BookTag") }

        it "正しいオブジェクトが返される" do
          is_expected.to eq(book_tags)
        end
      end

      context "映画のタグ" do
        let!(:tags) { FactoryBot.create_list(:tag, 5, :for_movie, user: user) }
        let!(:movie_tags) { tags.map{ |t| t.becomes(MovieTag) } }
        subject { user.get_associated_objects("MovieTag") }

        it "正しいオブジェクトが返される" do
          is_expected.to eq(movie_tags)
        end
      end
    end
  end
end
