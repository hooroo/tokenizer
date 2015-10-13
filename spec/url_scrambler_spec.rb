require 'spec_helper'

describe UrlScrambler do
  let(:original_object) { {"foo" => "bar", "one" => 2} }
  let(:encoded)         { described_class.encode(original_object) }

  describe ".encode" do
    subject(:encode) { encoded }

    it "invokes .encode on UrlScrambler::Encoder" do
      expect(UrlScrambler::Encoder).to receive(:encode).with(original_object)
      subject
    end
  end

  describe ".decode" do
    subject(:decode) { described_class.decode(encoded) }

    it "invokes .decode on UrlScrambler::Decoder" do
      expect(UrlScrambler::Decoder).to receive(:decode).with(encoded)
      subject
    end
  end

  describe ".secure" do
    subject(:secure) { described_class.secure() }
    it "returns a new UrlScrambler::Secured" do
      is_expected.to be_a(UrlScrambler::Secured)
    end
  end
end
