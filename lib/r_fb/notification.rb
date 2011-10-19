module RFb
  class Notification
    
    # usage:
    # Notification.send(to_ids: recipients_ids, notification: RFB::Notification::INVITE)
    #
    # to_ids: recipients_ids, notification: "fbml and html allowed"
    def send(opts)
      RFb.request(opts)
    end
  end
end