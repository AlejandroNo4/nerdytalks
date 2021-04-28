require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_many(:talks) }
    it { should have_many(:followers) }
    it { should have_many(:followeds) }
    it { should have_one_attached(:photo) }
    it { should have_one_attached(:cover_image) }
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:full_name).of_type(:string) }
    it { should have_db_column(:photo).of_type(:string) }
    it { should have_db_column(:cover_image).of_type(:string) }
  end

  context 'Validations' do
    it { should validate_length_of(:username).is_at_most(25) }
    it { should validate_length_of(:full_name).is_at_most(25) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:cover_image) }
    it { should validate_uniqueness_of(:username) }
    it { is_expected.to allow_value("aval1dname").for(:username) }
    it { is_expected.to_not allow_value("invalid name").for(:username) }
  end
end
