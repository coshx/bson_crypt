require 'spec_helper'

describe BSON::BSON_RUBY do
  describe "#serialize" do
    it "encrypts strings in a document" do
      doc = {"hello" => "world"}
      ser = subject.serialize(doc)
      ser.to_s.should_not =~ /world/
    end
  end

  describe "#deserialize" do
    it "decrypts strings in a serialized document" do
      doc = {"hello" => "world"}
      ser = subject.serialize(doc)
      deser = subject.deserialize(ser)
      deser.to_s.should =~ /world/
    end
  end
end
