require_relative 'notification_service'

class EmailNotification < NotificationService
  def send_message(member, message)
    puts "Email sent to #{member.name}: #{message}"
  end
end
