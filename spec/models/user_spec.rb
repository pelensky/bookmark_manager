describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
  end

  it 'authenticates' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
