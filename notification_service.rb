class NotificationService
  def send_message(member, message)
    raise NotImplementedError, 'Subclasses must implement send_message'
  end
end
