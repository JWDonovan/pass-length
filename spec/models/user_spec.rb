require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid with valid maximum password length' do
    user = User.new
    user.email = 'test@gmail.com'
    user.password = '0' * User.password_length.max
    expect(user).to be_valid
  end

  it 'should not be valid with invalid maximum password length' do
    user = User.new
    user.email = 'test@gmail.com'
    user.password = '0' * (User.password_length.max + 1)
    expect(user).to_not be_valid
  end
end
