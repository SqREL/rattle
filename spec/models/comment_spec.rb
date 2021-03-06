require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should belong_to :owner }
  it { should belong_to :post }

  it { should validate_presence_of :body }
  it { should validate_presence_of :owner }
  it { should validate_presence_of :post }
end
