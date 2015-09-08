require 'rails_helper'

RSpec.describe Post, :type => :model do
  it { should belong_to :owner }
  it { should have_many :comments }
  it { should have_many :votes }

  it { should validate_presence_of :title }
  it { should validate_presence_of :url }

end
