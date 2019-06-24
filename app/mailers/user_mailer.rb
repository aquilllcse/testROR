class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation.subject
  #
  def confirmation
    @room = params[:conference_room]
    # mail (to:  @room.user.email, subject: "")
    mail(to: @room.user.email, subject: 'Room booking confirmation')
  end
end
