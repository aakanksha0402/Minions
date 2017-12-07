require 'rails_helper'

RSpec.describe Author, type: :model do

  let(:author) { FactoryBot.create(:author) }

  describe "associations" do
    it { should have_and_belongs_to_many(:books) }
  end

end
