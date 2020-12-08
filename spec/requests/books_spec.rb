require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:tsundoc_list) { FactoryBot.create(:tsundoc_list, user: user) }
  let(:tags) { FactoryBot.create_list(:tag, 3, :for_book) }
  let(:tag_ids) { tags.map{ |t| t.id } }


  describe "GET#new" do
    it "200レスポンス" do
      get new_book_path
      expect(response).to have_http_status(200)
    end
  end


  describe "POST#create" do
    before do
      sign_in user
    end
    it "302レスポンス" do
      post books_path, params: { priority_pt: 100, secret: false, title: "book", author: "John", tag_ids: tag_ids}
      expect(response).to have_http_status(302)
    end
  end
end
