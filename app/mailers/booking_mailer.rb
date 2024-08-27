class BookingMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def booking_confirmation(booking)
    @booking = booking
    @user = @booking.user 
    mail(to: @user.email, subject: 'Booking Confirmation')
  end
end
