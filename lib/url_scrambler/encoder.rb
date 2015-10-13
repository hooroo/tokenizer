module UrlScrambler
  class Encoder
    attr_reader :message

    def self.encode(message)
      self.new(message).encoded_message
    end

    def initialize(message)
      @message = message
    end

    def encoded_message
      urlsafe_encoded_string serialized_message
    end

    private
    def serialized_message
      message.to_msgpack
    end

    def urlsafe_encoded_string(source)
      Base64.urlsafe_encode64 source
    end
  end
end
