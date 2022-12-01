require 'rails_helper'

RSpec.describe User, :type => :model do
  subject do
    User.new(name: 'Esi Ogagaoghene', email: 'esi.ogagaoghene@yahoo.com', password: 'oracle', confirmed_at: Time.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
