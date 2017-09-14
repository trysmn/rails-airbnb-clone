class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation.subject
  #
  def confirmation(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Beer-BNB')
    # This will render a view in `app/views/user_mailer`!
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.book_request.subject
  #
  def book_request(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.review_request.subject
  #
  def review_request(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reminder.subject
  #
  def reminder(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
