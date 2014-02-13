require "im/version"
require 'appscript'

module Im
  class << self

	def is_i str
      !!(str =~ /^[-+]?[0-9]+$/)
	end

	def send_message message, buddy
      if is_i buddy
        puts "Sending \'#{message}\'  to chat number #{buddy}"
        `osascript -e 'tell application "Messages" to send \"#{message}\" to item #{buddy.to_i} of text chats'`
      else
        puts "Sending \'#{message}\' to buddy \'#{buddy}\'"
        `osascript -e 'tell application "Messages" to send \"#{message}\" to buddy \"#{buddy}\"'`
      end
	end

	def get_chat_list
      imsg = Appscript.app("Messages")
      participants = imsg.chats.participants.get()
      participants.map.with_index do |participant, index|
        { id: index+1, name: participant.first.name.get(), object: participant.first }
      end
	end

  end
end
