module  Features
  module Staff
    module SessionHelpers
      def sign_in_with(email, password)
        visit root_path
        click_link 'Sign In'
        fill_in 'user_email', with: email
        fill_in 'user[password]', with: password
        click_button 'Sign in'
      end

      def html_signin(user)
        sign_in_with user.email, user.password
      end
    end
  end
end
