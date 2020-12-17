# frozen_string_literal: true

##
class EasyPostMailer < ApplicationMailer
  default from: 'noreply@bbabackoffice.com'

  def email_label_url(rental_return)
    @rental_return = rental_return
    @easy_post = rental_return.accountable

    mail(from: "'#{@easy_post.company_name}' <#{@easy_post.email}>", to: @rental_return.email, subject: 'Confirmation from EasyPost Email/Online Label')
  end
end
