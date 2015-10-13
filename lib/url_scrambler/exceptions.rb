module UrlScrambler
  class Error < StandardError; end
  class DecodingError < UrlScrambler::Error; end
  class MissingEncryptionKey < UrlScrambler::Error; end
end
