module UrlScrambler
  class Decoder
    attr_reader :encoded_message

    def self.decode(encoded_message)
      self.new(encoded_message).decoded_message
    end

    def initialize(encoded_message)
      @encoded_message = encoded_message
    end

    def decoded_message
      deserialized_message
    end

    private
    def decoded_string
      begin
        Base64.urlsafe_decode64 encoded_message
      rescue ArgumentError => e
        raise UrlScrambler::DecodingError
      end
    end

    def deserialized_message
      begin
        MessagePack.unpack(decoded_string)
      rescue MessagePack::UnpackError => e
        raise UrlScrambler::DecodingError
      end
    end
  end
end
