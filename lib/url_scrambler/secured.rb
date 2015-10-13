module UrlScrambler
  class Secured
    attr_reader :key, :encoder, :decoder

    def initialize(key = nil)
      @key = key || rails_secret_token
      @encoder = UrlScrambler::Encoder
      @decoder = UrlScrambler::Decoder
      raise UrlScrambler::MissingEncryptionKey unless @key
    end

    def encode(message)
      Base64.urlsafe_encode64 encrypted_message(message)
    end

    def decode(message)
      begin
        enc = Base64.urlsafe_decode64(message)
        decoder.decode(AES.decrypt(enc, key))
      rescue OpenSSL::Cipher::CipherError => e
        raise UrlScrambler::DecodingError
      end
    end

    private
    def encrypted_message(message)
      AES.encrypt(encoded_message(message), key)
    end

    def encoded_message(message)
      result = encoder.encode(message)
    end

    def rails_secret_token
      if is_running_in_rails_application?
        rails_url_scrambler_secret_token || hashed_rails_default_secret_token
      end
    end

    def rails_url_scrambler_secret_token
      Rails.application.secrets.url_scrambler_token if rails_app_has_custom_secrets?
    end

    def rails_app_has_custom_secrets?
      !!defined?(Rails.application.secrets)
    end

    def hashed_rails_default_secret_token
      Digest::MD5.hexdigest Rails.configuration.secret_token
    end

    def is_running_in_rails_application?
      !!defined?(Rails)
    end
  end
end
