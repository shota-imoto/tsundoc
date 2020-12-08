require 'rails_helper'

RSpec.describe Tagging, type: :model do

  describe 'factory' do
    let(:tsundoc_list) { FactoryBot.create(:tsundoc_list, :with_user) }
    before { Tagging.factory(tag_ids, tsundoc.id) }

    context "本のタグを入力した場合" do
      let(:tsundoc) { FactoryBot.create(:tsundoc, :with_book, tsundoc_list: tsundoc_list) }
      let(:tag_ids) { tags.map{ |t| t.id } }

      context "３個のダグ付をしたい場合" do
        let(:tags) { FactoryBot.create_list(:tag, 3, :for_book) }
        it "タグ付けリストが生成される" do
          expect(Tagging.count).to eq 3
        end
      end

      context "0個のタグ付をしたい場合" do
        let(:tags) { FactoryBot.create_list(:tag, 0, :for_book) }
        it "タグ付リストは生成されない" do
          expect(Tagging.count).to eq 0
        end
      end
    end

    context "映画のタグを入力した場合" do
      let(:tsundoc) { FactoryBot.create(:tsundoc, :with_movie, tsundoc_list: tsundoc_list) }
      let(:tag_ids) { tags.map{ |t| t.id } }

      context "３個のダグ付をしたい場合" do
        let(:tags) { FactoryBot.create_list(:tag, 3, :for_movie) }
        it "タグ付けリストが生成される" do
          expect(Tagging.count).to eq 3
        end
      end

      context "0個のタグ付をしたい場合" do
        let(:tags) { FactoryBot.create_list(:tag, 0, :for_movie) }
        it "タグ付リストは生成されない" do
          expect(Tagging.count).to eq 0
        end
      end
    end
  end
end
