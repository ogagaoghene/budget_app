require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    described_class.new(name: 'Foods',
                        icon: 'burger.jpg')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
