require 'rails_helper'

RSpec.describe Talk, type: :model do
  context 'Associations' do
    it { should belong_to(:author) }
    it { should have_db_column(:author_id).of_type(:integer) }
    it { should have_db_column(:text).of_type(:text) }
  end

  context 'Validations' do
    it { should validate_length_of(:text).is_at_most(140) }
    it { should validate_presence_of(:text) }
    it { is_expected.to allow_value("a valid text").for(:text) }
  end
end