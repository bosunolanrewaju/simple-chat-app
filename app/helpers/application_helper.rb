module ApplicationHelper
  # def message_sender(chat)
  #   chat.sender.id == current_user.id ? 'You' : chat.sender.name
  # end

  # def message_receiver(chat)
  #   chat.receiver.id == current_user.id ? 'You' : chat.receiver.name
  # end

  [:sender, :receiver].each do |title|
    define_method :"message_#{title}" do |chat|
      chat.public_send(title).id == current_user.id ? 'You' : chat.public_send(title).name
    end
  end
end
