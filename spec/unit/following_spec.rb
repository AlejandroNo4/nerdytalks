require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Associations' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
    it { should have_db_column(:follower_id).of_type(:integer) }
    it { should have_db_column(:followed_id).of_type(:integer) }
  end
end