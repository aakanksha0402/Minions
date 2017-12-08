require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:book) { FactoryBot.create(:book) }

  before(:each) do
    book.authors << FactoryBot.create(:author)
    @authors = book.authors
  end

  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:authors) }
  end

  it 'has valid factory' do
    p "********", book
    expect(book).to be_valid
  end

  it 'has associated authors' do
    p @authors
    expect(@authors.count).to eq(1)
  end

end
