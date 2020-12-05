require 'rails_helper'

RSpec.describe "Tsundocs", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:tsundoc_list) { FactoryBot.create(:tsundoc_list, user: user) }

  describe "GET#new" do
    it "200レスポンス" do
      get new_tsundoc_path
      expect(response).to have_http_status(200)
    end
  end


  describe "POST#create" do
    before do
      sign_in user
    end
    it "302レスポンス" do
      post tsundocs_path, params: { priority_pt: 100, secret: false, title: "book", author: "John", kind: "book" }
      expect(response).to have_http_status(302)
    end
  end
end
