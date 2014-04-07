class Notifications < ActionMailer::Base
  default from: "admin@lunchbreak.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_event.subject
  #
  def new_event(event)
    @greeting = "Hi"
    @id = event.id

    mail to: event.user.email
  end

  def followed(follow)
    @greeting = "hey there!"
    @follower = follow.follower.name
    @id = follow.follower_id

    mail to: follow.followee.email
  end
end
