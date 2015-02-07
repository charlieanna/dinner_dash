module Feature
  def sign_in
    user = FactoryGirl.create(:user)
    sign_in_as user
  end

  def sign_in_as(user)
    visit root_path
    click_link "Login"
    fill_in 'email', with: user.email
    fill_in 'password',with: user.password
    click_button 'Login'
  end
end