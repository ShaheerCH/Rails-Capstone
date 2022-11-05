require 'rails_helper'

RSpec.describe(Category, type: :model) do
  before(:all) { @user = User.new(name: 'Shaheer shah', email: 'shaheer@email.com', password: '123456') }

  describe('Has Assosiations') do
    it { should belong_to(:entity) }
    it { should belong_to(:group) }
  end
end
