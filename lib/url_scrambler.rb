# encoding: utf-8

require 'msgpack'
require 'base64'
require 'url_scrambler/encoder'
require 'url_scrambler/decoder'

module UrlScrambler
  class << self
    def encode(message)
      Encoder.encode(message)
    end

    def decode(message)
      Decoder.decode(message)
    end
  end

  MAJOR= 0
  MINOR= 0
  PATCH= ENV['PATCH_VERSION'] || 0

  private_constant :MAJOR, :MINOR, :PATCH

  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}"
end

