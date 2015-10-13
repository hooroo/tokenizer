require 'spec_helper'

describe UrlScrambler::Encoder do
  let(:original_object) { {"foo" => "bar", "one" => 2} }

  shared_examples "an encoder" do
    it "returns a string" do
      is_expected.to be_a String
    end

    it "is URL-safe" do
      is_expected.to match /\A[A-z0-9_\-=]+\Z/
    end
  end

  describe '.encode' do
    subject(:encode) { described_class.encode(original_object) }
    it_behaves_like "an encoder"
  end

  describe "#initialize" do
    subject(:encoder) { described_class.new(original_object) }

    describe "message attribute" do
      subject(:attr) { encoder.message }
      it "is assigned" do
        is_expected.to eq(original_object)
      end
    end
  end

  describe "#encoded_message" do
    subject(:encoded_message) { described_class.new(original_object).encoded_message }
    it_behaves_like "an encoder"
  end
end
