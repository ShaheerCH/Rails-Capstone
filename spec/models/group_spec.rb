require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Shaheer shah', email: 'shaheer@test.com', password: '123456')
    @group = described_class.create(
      user_id: @user.id,
      name: 'Test Category',
      icon: 'money.png'
    )
  end

  describe('has associations') do
    it { should belong_to(:user) }
    it { should have_many(:entities).through(:categories) }
    it { should have_many(:categories) }
  end

  it 'Title to not be blank' do
    @group.name = ''
    expect(@group).to_not be_valid
  end

  it 'Title should be valid' do
    expect(@group).to be_valid
  end
end
