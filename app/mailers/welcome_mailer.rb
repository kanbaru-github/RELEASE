class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_create.subject
  #

  # emailアドレスだけを取り出してメールの送信先に。こうすることでメール送信先を自動的に変更することが可能。
  def send_when_create(customer)
    @customer = customer
    mail to: customer.email,
         subject: '会員登録ができました！'
  end
end
