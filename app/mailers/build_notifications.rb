class BuildNotifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.build_notifications.success.subject
  #

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.build_notifications.failure.subject
  #

  def status(build)
    @build = build

    mail to: @build.owner_email, subject: "#{build.name} #{build.status_text}"
  end
end
