require 'spec_helper'

describe BsonCrypt do
  describe "#crypt" do
    it "defaults to PKey" do
      BsonCrypt.crypt.class.should be BsonCrypt::PKeyCrypt
    end
  end

  describe BsonCrypt::PKeyCrypt do
    it "encrypts a string" do
      str = "hello"
      crypt = BsonCrypt::PKeyCrypt.new
      enc = crypt.encrypt(str)
      enc.should_not =~ /#{str}/
    end

    it "decrypts an encrypted string" do
      str = "hello, world!"
      crypt = BsonCrypt::PKeyCrypt.new
      enc = crypt.encrypt(str)
      dec = crypt.decrypt(enc)
      dec.should == str
    end
  end
end
