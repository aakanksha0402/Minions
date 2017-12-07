require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:book) { FactoryBot.create(:book) }

  describe "associations" do
    it "puts" do

      puts book.as_json
      puts book.authors.as_json
    end
    it { should have_and_belongs_to_many(:authors) }
  end
end
