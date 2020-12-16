require 'rails_helper'

RSpec.describe "Tags", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET#new" do
    it "200レスポンス" do
      get new_tag_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    subject { post tags_path, params: { name: tag_name, type: "BookTag" } }

    context "正常なパラメータを渡した場合" do
      let(:tag_name) { "tag" }
      it "302レスポンス" do
        subject
        expect(response).to have_http_status(302)
      end
    end

    context "tag名が空の場合" do
      let(:tag_name) { nil }
      it "200レスポンス" do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
