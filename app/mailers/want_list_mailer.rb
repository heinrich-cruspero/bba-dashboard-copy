class WantListMailer < ApplicationMailer
  default from: 'noreply@bbabackoffice.com'

  def shared_want_list(user, want_list)
    @user = user
    @want_list = want_list

    mail(to: user.email, subject: 'Shared want list.')
  end
end
