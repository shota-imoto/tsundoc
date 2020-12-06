require 'rails_helper'

RSpec.describe Tsundoc, type: :model do

  describe 'list_owned_by' do
    let(:user) { FactoryBot.create(:user) }
    let(:tsundoc_list) { FactoryBot.create(:tsundoc_list, user: user) }

    subject { Tsundoc.list_owned_by(user) }

    context "本を登録した場合" do
      let!(:tsundocs) { FactoryBot.create_list(:tsundoc, 5, :with_book, tsundoc_list: tsundoc_list) }
      it "積ん読リストが返される" do
        is_expected.to include *tsundocs
      end
    end

    context "映画を登録した場合" do
      let!(:tsundocs) { FactoryBot.create_list(:tsundoc, 5, :with_movie, tsundoc_list: tsundoc_list) }
      it "積ん読リストが返される" do
        is_expected.to include *tsundocs
      end
    end
  end
end
