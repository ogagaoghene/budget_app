require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  subject do
    user = User.create(name: 'Esi Ogagaoghene', email: 'esi.ogagaghene@yahoo.com', password: 'oracle', confirmed_at: Time.now)
    category = Category.create(user_id: user.id, name: 'Foods', icon: 'burger.jpg')
    payment = Payment.create(name: 'Burger', user_id: user.id, amount: 100)
    CategoryPayment.new(category_id: category.id, payment_id: payment.id)
  end

  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end
end
