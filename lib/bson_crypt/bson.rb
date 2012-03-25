require 'base64'
require 'bson'

module BsonCrypt
  def self.encrypt(text)
    BsonCrypt.crypt.encrypt(text)
  end

  def self.decrypt(text)
    BsonCrypt.crypt.decrypt(Base64.decode64(text))
  end
end

module BSON
  class BSON_RUBY
    def self.serialize_cstr(buf, val)
      buf.put_binary(to_utf8_binary(BsonCrypt.encrypt(val.to_s)))
      buf.put_binary(NULL_BYTE)

      puts "val.length: #{val.length}, enc.length: #{BsonCrypt.encrypt(val.to_s).length}"
    end

    def deserialize_cstr(buf)
      chars = ""
      while true
        b = buf.get
        break if b == 0
        chars << b.chr
      end
      puts "buf is '#{buf.inspect}'"
      puts "chars is '#{chars.inspect}'"
      encoded_str(BsonCrypt.decrypt(chars))
    end
  end
end
