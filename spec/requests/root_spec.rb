require 'rails_helper'

RSpec.describe "Roots", type: :request do
  let(:user) { FactoryBot.create(:user) }
  # let(:tsundoc_list) { FactoryBot.create(:tsundoc_list, user: user) }

  describe "GET#index" do
    let!(:book_tsundocs) { FactoryBot.create_list(:tsundoc, 5, :with_book, :with_book_tag, user: user) }
    let!(:movie_tsundocs) { FactoryBot.create_list(:tsundoc, 5, :with_movie, :with_movie_tag, user: user) }
    let(:book_titles) { book_tsundocs.map{|t| t.tsundocable.title} }
    let(:movie_titles) { movie_tsundocs.map{|t| t.tsundocable.title} }
    let(:book_tag_names) { book_tsundocs.map{|t| t.tags.first.name } }
    let(:movie_tag_names) { movie_tsundocs.map{|t| t.tags.first.name } }

    before do
      sign_in user
    end

    subject { response.body }

    context "初回表示の場合" do
      before { get root_path }

      it "200レスポンス" do
        expect(response).to have_http_status(200)
      end

      it "本のtsundocリストがすべて表示される" do
        is_expected.to include *book_titles
      end

      it "映画のtsundocリストは表示されない" do
        is_expected.to_not include *movie_titles
      end

      it "本のtagがすべて表示される" do
        is_expected.to include *book_tag_names
      end

      it "映画のtagは表示されない" do
        is_expected.to_not include *movie_tag_names
      end
    end

    context "本のリストを表示する場合" do
      before { get root_path(tag_type: "BookTag") }

      it "200レスポンス" do
        expect(response).to have_http_status(200)
      end

      it "本のtsundocリストは表示される" do
        is_expected.to include *book_titles
      end

      it "映画のtsundocリストは表示されない" do
        is_expected.to_not include *movie_titles
      end

      it "本のtagがすべて表示される" do
        is_expected.to include *book_tag_names
      end

      it "映画のtagは表示されない" do
        is_expected.to_not include *movie_tag_names
      end
    end

    context "映画のリストを表示する場合" do
      before { get root_path(tag_type: "MovieTag") }

      it "200レスポンス" do
        expect(response).to have_http_status(200)
      end

      it "本のtsundocリストは表示されない" do
        is_expected.to_not include *book_titles
      end

      it "映画のtsundocリストは表示される" do
        is_expected.to include *movie_titles
      end

      it "本のtagは表示されない" do
        is_expected.to_not include *book_tag_names
      end

      it "映画のtagはすべて表示される" do
        is_expected.to include *movie_tag_names
      end
    end
  end
end
