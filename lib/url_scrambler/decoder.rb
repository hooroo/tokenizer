# encoding: utf-8

module UrlScrambler
  class Decoder

    def self.decode(message)
      decoded = Base64.urlsafe_decode64(message)
    rescue ArgumentError => e
      decoded = Base64.decode64(message)
    ensure
      return MessagePack.unpack(decoded) if decoded
    end

  end
end