require 'spec_helper'

describe BsonCrypt do
  before do
    crypt = mock()
    crypt.stub(:encrypt).and_return("encrypted")
    crypt.stub(:decrypt).and_return("decrypted")
    BsonCrypt.crypt = crypt
  end

  describe "#encrypt" do
    it "encrypts a string" do
      str = "hello"
      enc = subject.encrypt(str)
      enc.should_not =~ /hello/
      enc.should == "encrypted"
    end
  end

  describe "#decrypt" do
    it "decrypts a string" do
      str = "encrypted"
      dec = subject.decrypt(str)
      dec.should == "decrypted"
    end
  end
end
