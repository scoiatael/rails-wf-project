class Notifier < ActionMailer::Base
  def new_user(user)
    @user = user
    admin_mail = Rails.application.config.action_mailer.default_options[:from]
    mail to: admin_mail, subject: "New user #{user.email}"
  end

  def been_invited(email, opts)
    @user = opts[:by] if opts[:by]
    mail to: email, subject: "Invitation to Wieczorki Filmowe"
  end
end
