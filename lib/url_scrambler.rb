require 'msgpack'
require 'base64'
require 'aes'
require 'url_scrambler/decoder'
require 'url_scrambler/encoder'
require 'url_scrambler/exceptions'
require 'url_scrambler/secured'

module UrlScrambler
  def self.encode(message)
    Encoder.encode(message)
  end

  def self.decode(message)
    Decoder.decode(message)
  end

  def self.secure(key = nil)
    Secured.new(key)
  end
end
