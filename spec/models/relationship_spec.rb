# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
# Indexes
#
#  index_relationships_on_followed_id                  (followed_id)
#  index_relationships_on_follower_id                  (follower_id)
#  index_relationships_on_follower_id_and_followed_id  (follower_id,followed_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }
  let(:active) { user.active_relationships.build(followed_id: other_user.id) }
  subject { active }

  it { should be_valid }

  describe "follow/followed methods" do
    it { should respond_to(:follower)}
    it { should respond_to(:followed)}
    
    # フォロワーを返すメソッド
    it "follower method return followers" do
      expect(active.follower). to eq user
    end

    # フォローしているユーザーを返すメソッド
    it "followed methos return following-users" do
      expect(active.followed). to eq other_user
    end
  end

  describe "validations" do
    describe "presence" do
      it { is_expected.to validate_presence_of :followed_id }
      it { is_expected.to validate_presence_of :follower_id }
    end
  end
end
