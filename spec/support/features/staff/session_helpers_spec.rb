module  Features
  module Staff
    module SessionHelpers
      include Warden::Test::Helpers
      Warden.test_mode!

      def html_signin(user)
        login_as(user, scope: :user, run_callbacks: false)
      end
    end
  end
end
