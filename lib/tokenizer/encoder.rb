# encoding: utf-8

module Tokenizer
  class Encoder

    def self.encode(message)
      Base64.urlsafe_encode64(message.to_msgpack)
    end

  end
end