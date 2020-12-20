require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:tags) { FactoryBot.create_list(:tag, 3, :for_movie, user: user) }
  let(:tag_ids) { tags.map(&:id) }
  let(:tag_names) { tags.map(&:name) }
  before { sign_in user }

  describe "GET#new" do
    let!(:other_users_tags) { FactoryBot.create_list(:tag, 3, :for_movie, :with_user) }
    let(:other_tag_names) { other_users_tags.map(&:name) }
    before { get new_movie_path }

    it "200レスポンス" do
      expect(response).to have_http_status(200)
    end

    it "登録したタグが表示されている" do
      expect(response.body).to include *tag_names
    end

    it "別ユーザーのタグは表示されない" do
      expect(response.body).to_not include *other_tag_names
    end
  end

  describe "POST#create" do
    it "302レスポンス" do
      post movies_path, params: { priority_pt: 100, secret: false, title: "movie", tag_ids: tag_ids}
      expect(response).to have_http_status(302)
    end
  end
end
