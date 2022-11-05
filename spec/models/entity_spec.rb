require 'rails_helper'

RSpec.describe(Entity, type: :model) do
  before(:all) { @user = User.new(name: 'Shaheer shah', email: 'shaheer@email.com', password: '123456') }

  describe('Has Assosiations') do
    it { should belong_to(:user) }
    it { should have_many(:categories) }
    it { should have_many(:groups).through(:categories) }
  end

  describe('Has valid arguments') do
    it('should be valid') do
      entity = described_class.new(name: 'shah', amount: 5, user: @user)
      expect(entity).to be_valid
    end
  end

  describe('Invalid with no arguments') do
    it('without arguments') { expect(described_class.new).to_not be_valid }

    it('without name') do
      entity = described_class.new(amount: 5, user: @user)
      expect(entity).to_not be_valid
    end
  end
end
