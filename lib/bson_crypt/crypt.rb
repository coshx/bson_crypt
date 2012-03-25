require 'openssl'

module BsonCrypt
  def self.crypt
    @crypt ||= PKeyCrypt.new
  end
  def self.crypt=(crypt)
    @crypt = crypt
  end

  class PKeyCrypt
    def initialize(priv_key=nil, passphrase=nil)
      priv_key ||= ENV['BSON_CRYPT_PEM']
      passphrase ||= ENV['BSON_CRYPT_PASSPHRASE']
      if priv_key
        @cipher = OpenSSL::PKey::RSA.new priv_key, passphrase
      else
        @cipher = OpenSSL::PKey::RSA.generate(2048)
      end
    end

    def encrypt(text)
      Base64.strict_encode64(@cipher.public_encrypt(text))
    end

    def decrypt(text)
      @cipher.private_decrypt(Base64.decode64(text))
    end
  end
end
