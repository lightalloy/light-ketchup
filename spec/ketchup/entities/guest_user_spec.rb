RSpec.describe GuestUser do
  # place your tests here
  it 'is authenticated' do
    expect(GuestUser.new.authenticated?).to eq(false)
  end
end
