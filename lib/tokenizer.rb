# encoding: utf-8

require 'msgpack'
require 'base64'
require 'tokenizer/encoder'
require 'tokenizer/decoder'

module Tokenizer
  class << self
    def encode(message)
      Encoder.encode(message)
    end

    def decode(message)
      Decoder.decode(message)
    end
  end
end

