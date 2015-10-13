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

    it "returns the original object" do
      is_expected.to eq(original_object)
    end

    shared_examples "a decoding error" do
      it "raises UrlScambler::DecodingError"
    end

    context "when there is a message pack error" do
      it_behaves_like "a decoding error"
    end

    context "when there is a parsing error" do
      it_behaves_like "a decoding error"
    end

    context "when there is an end of file error" do
      it_behaves_like "a decoding error"
    end
  end

  describe ".secure" do
    subject(:secure) { described_class.secure() }
    it "returns a new UrlScrambler::Secured" do
      is_expected.to be_a(UrlScrambler::Secured)
    end
  end
end
