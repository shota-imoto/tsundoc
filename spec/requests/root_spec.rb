require 'rails_helper'

RSpec.describe "Roots", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:tsundoc_list) { FactoryBot.create(:tsundoc_list, user: user) }

  describe "GET#index" do
    before do
      sign_in user
    end

    subject { response.body }

    context "本を登録した場合tsundocリストがすべて表示されている" do
      let!(:tsundocs) { FactoryBot.create_list(:tsundoc, 5, :with_book, tsundoc_list: tsundoc_list) }
      let(:book_title_array) { tsundocs.map{|t| t.tsundocable.title} }
      it "tsundocリストがすべて表示されている" do
        get root_path
        is_expected.to include *book_title_array
      end
    end

    context "映画を登録した場合" do
      let!(:tsundocs) { FactoryBot.create_list(:tsundoc, 5, :with_movie, tsundoc_list: tsundoc_list) }
      let(:movie_title_array) { tsundocs.map{|t| t.tsundocable.title} }
      it "tsundocリストがすべて表示されている" do
        get root_path
        is_expected.to include *movie_title_array
      end
    end
  end
end
