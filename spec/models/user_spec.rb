require 'rails_helper'

RSpec.describe(User, type: :model) do
  it 'should be valid with arguments' do
    expect(described_class.new(name: 'Shaheer shah', email: 'shaheer@email.com', password: '123456')).to be_valid
  end

  it('should be invalid') do
    expect(described_class.new).to_not be_valid
  end

  it('invalid without password') do
    user = described_class.new(name: 'shaheer', email: 'shaheer@email.com')
    expect(user).to_not be_valid
  end

  it('invalid with less than 3 chars') do
    user = described_class.new(name: 'r', email: 'shaheer@some.email', password: '123456')
    expect(user).to_not be_valid
  end

  it('invalid without email') do
    user = described_class.new(name: 'shaheer', password: '123456')
    expect(user).to_not be_valid
  end
end
