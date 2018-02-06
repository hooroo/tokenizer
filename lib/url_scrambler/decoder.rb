# encoding: utf-8

module UrlScrambler
  class Decoder

    class << self
      def decode(message)
        decoded = base64_decoded(message)
        MessagePack.unpack(decoded) if decoded
      rescue MessagePack::UnpackError => e
        nil
      end

      private

      def base64_decoded(message)
        return unless message
        Base64.urlsafe_decode64(message)
      rescue ArgumentError => e
        Base64.decode64(message)
      end
    end
  end
end