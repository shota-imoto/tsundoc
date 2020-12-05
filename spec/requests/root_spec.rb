require 'rails_helper'

RSpec.describe "Roots", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:tsundoc_list) { FactoryBot.create(:tsundoc_list, user: user) }

  describe "GET#index" do
    before do
      sign_in user
    end
    it "tsundocリストがすべて表示されているか" do
      tsundocs = FactoryBot.create_list(:tsundoc, 5, :with_book, tsundoc_list: tsundoc_list)
      book_title_array = tsundocs.map{|t| t.get_tsundoc_product.title}

      get root_path
      expect(response.body).to include *book_title_array
    end
  end
end
