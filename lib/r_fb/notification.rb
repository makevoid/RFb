module RFb
  class Notification
    
    INVITE = "Sell your things to your friends and other facebook users. <fb:req-choice url='http://apps.facebook.com/alibazaar/' label='Add Ali Bazaar' />"
    
    # usage:
    # Notification.send(to_ids: recipients_ids, notification: RFB::Notification::INVITE)
    #
    # to_ids: recipients_ids, notification: "fbml and html allowed"
    def send(opts)
      RFb.request(opts)
    end
  end
end