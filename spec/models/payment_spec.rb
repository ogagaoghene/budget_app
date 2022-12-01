require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject do
    user = User.create(name: 'Esi Ogagaoghene', email: 'esi.ogagaghene@yahoo.com', password: 'oracle',
                       confirmed_at: Time.now)
    Payment.new(name: 'Burger', id: user.id, amount: 100)
  end

  it 'is not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with amount less than zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
