require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many :comments }
  it { should have_many :votes }
  it { should have_many :posts }

  describe '#vote_for' do
    let(:user) { create :user }
    let(:post) { create :post }

    context 'once' do
      it { expect{ user.vote_for(post, 'up') }.to change{Vote.count}.by(1) }
    end

    context 'twice' do
      it { expect{ user.vote_for(post, 'up'); user.vote_for(post, 'up') }.to change{Vote.count}.by(1) }
    end
  end
end
