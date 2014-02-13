require 'im/version'
require 'appscript'

module Im
  class << self

	def send_message(message, chat)
      puts "Sending '#{message}' to #{chat[:name]}"
      `osascript -e 'tell application "Messages" to send \"#{message}\" to item #{chat[:id].to_i} of text chats'`
	end

	def get_chat_list
      im = Appscript.app("Messages")
      participants = im.chats.participants.get()
      participants.map.with_index do |participant, index|
        { id: index+1, name: participant.first.name.get(), object: participant.first }
      end
	end

    def get_chat_from_number(chats, number)
      chats.select { |chat| chat[:id] == number.to_i }[0]
    end

  end
end
