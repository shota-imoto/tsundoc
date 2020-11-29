require 'rails_helper'

RSpec.describe "Tsundocs", type: :request do
  # let(:user) { FactoryBot.create(:user) }
  describe "GET#new" do
    it "200レスポンス" do
      get new_tsundoc_path
      expect(response).to have_http_status(200)
    end
  end


  describe "POST#create" do
    before do
      user = FactoryBot.create(:user)
      sign_in user
    end
    it "200レスポンス" do
      post tsundocs_path, params: { priority_pt: 100, private: false, title: "book", author: "John" }
      expect(response).to have_http_status(200)
    end
  end
end
