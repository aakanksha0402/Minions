require 'rails_helper'

RSpec.describe Author, type: :model do

  let(:author) { FactoryBot.create(:author) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:books) }
  end

  it 'has valid factory' do
    expect(author).to be_valid
  end

end
