require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'factory' do
    let(:user) { FactoryBot.create(:user) }
    before { Tag.factory(params) }

    context "本のタグのパラメータを入力した場合" do
    let(:params) { FactoryBot.attributes_for(:tag, :for_book, user_id: user.id) }

      it "タグが作成される" do
        expect(Tag.count).to eq 1
      end
      it "本のタグが生成される" do
        expect(BookTag.count).to eq 1
      end
      it "映画のタグは生成されない" do
        expect(MovieTag.count).to eq 0
      end
    end

    context "映画のタグのパラメータを入力した場合" do
      let(:params) { FactoryBot.attributes_for(:tag, :for_movie, user_id: user.id) }

      it "タグが作成される" do
        expect(Tag.count).to eq 1
      end
      it "映画のタグは生成されない" do
        expect(MovieTag.count).to eq 1
      end
      it "本のタグが生成される" do
        expect(BookTag.count).to eq 0
      end
    end
  end
end
