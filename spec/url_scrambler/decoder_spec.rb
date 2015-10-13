require 'spec_helper'


describe UrlScrambler::Decoder do
  let(:original_object) { {"foo" => "bar", "one" => 2} }
  let(:encoded_object)  { UrlScrambler::Encoder.encode(original_object) }

  shared_examples "a decoder" do
    it "returns the original object" do
      is_expected.to eq original_object
    end

    context "when there is a messagepack error" do
      before do
        allow(MessagePack).to receive(:unpack) { raise MessagePack::UnpackError }
      end

      it "raises a UrlScramber::DecodingError" do
        expect { subject }.to raise_error(UrlScrambler::DecodingError)
      end
    end

    context "when there is a Base64 decoding error" do
      before do
        allow(Base64).to receive(:urlsafe_decode64) { raise ArgumentError }
      end

      it "raises a UrlScramber::DecodingError" do
        expect { subject }.to raise_error(UrlScrambler::DecodingError)
      end
    end
  end

  describe '.decode' do
    subject(:decode) { described_class.decode(encoded_object) }
    it_behaves_like "a decoder"
  end

  describe "#initialize" do
    subject(:decoder) { UrlScrambler::Decoder.new(encoded_object) }

    describe "encoded_message attribute" do
      subject(:encoded_message) { decoder.encoded_message }

      it "is assigned" do
        is_expected.to eq(encoded_object)
      end
    end
  end

  describe "#decoded_message" do
    subject(:decoded_message) { described_class.new(encoded_object).decoded_message }
    it_behaves_like "a decoder"
  end
end
