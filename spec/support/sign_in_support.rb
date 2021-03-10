module SignInSupport
  def sign_in(user)
    fill_in 'メールアドレス', with: user.email
    fill_in 'Password',     with: user.password
    click_on('ログイン')
  end
end