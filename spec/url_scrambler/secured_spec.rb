require 'spec_helper'

describe UrlScrambler::Secured do
  describe "#initialize" do
    subject(:secured) { described_class.new(key) }
    let(:key)         { nil }

    context "when key specified" do
      let(:key) { "password" }

      describe "key attribute" do
        subject(:attr) { secured.key }
        it "is assigned" do
          is_expected.to eq(key)
        end
      end
    end

    context "when key not specified" do
      describe "key" do
        subject(:key_attr) { secured.key }

        it "raises a UrlScrambler::MissingEncryptionKey" do
          expect{ secured }.to raise_error(UrlScrambler::MissingEncryptionKey)
        end

        context "in Rails" do
          let(:secret_token) { "a-really-great-token" }
          before do
            stub_const("Rails", Object.new)
          end

          context ">= 4.0.0" do
            let(:secret_token) { "foo" }
            let(:secrets){ OpenStruct.new(secret_token: secret_token) }
            let(:application) { OpenStruct.new(secrets: secrets) }

            before do
              allow(Rails).to receive(:application) { application }
              allow(Rails).to receive(:configuration) { OpenStruct.new(secret_token: secret_token) }
            end

            it "defaults to an MD5 hash of the application secret token" do
              is_expected.to eq(Digest::MD5.hexdigest secret_token)
            end

            context "with a custom secret token" do
              let(:custom_token) { "bar" }
              let(:secrets) { OpenStruct.new(secret_token: secret_token, url_scrambler_token: custom_token) }

              it "equals the custom token" do
                is_expected.to eq(custom_token)
              end
            end
          end

          context "< 4.0.0" do
            before do
              allow(Rails).to receive(:configuration) { OpenStruct.new(secret_token: secret_token) }
            end

            it "defaults to an MD5 hash of the application secret token" do
              is_expected.to eq(Digest::MD5.hexdigest secret_token)
            end
          end
        end
      end
    end
  end

  describe "#encode" do
    subject(:encode) { described_class.new(key).encode(original_object) }
    let(:key) { "fizzbuzz" }
    let(:original_object) { {"foo" => "bar", "one" => 2} }
    let(:encoder) { UrlScrambler::Encoder }

    it "invokes .encode on a UrlScrambler::Encoder" do
      expect(encoder).to receive(:encode).with(original_object).and_call_original
      subject
    end

    it "encrypts the encoded message" do
      is_expected.to_not eq UrlScrambler::Encoder.encode(original_object)
    end

    it "is URL-safe" do
      is_expected.to match /\A[A-z0-9_\-=]+\Z/
    end
  end

  describe "#decode" do
    subject(:decode) { described_class.new(key).decode(encrypted_message) }
    let(:key) { "fizzbuzz" }
    let(:original_object) { {"foo" => "bar", "one" => 2} }
    let(:encrypted_message) { described_class.new(key).encode(original_object) }
    let(:encoded_message) { UrlScrambler::Encoder.encode(original_object) }
    let(:decoder) { UrlScrambler::Decoder }

    it "invokes .decode on a UrlScrambler::Decoder" do
      expect(decoder).to receive(:decode).with(encoded_message).and_call_original
      subject
    end

    it "decrypts the encoded message" do
      is_expected.to eq(original_object)
    end

    context "when there is a cipher error" do
      before do
        allow(AES).to receive(:decrypt) { raise OpenSSL::Cipher::CipherError}
      end

      it "raises a UrlScrambler::DecodingError" do
        expect{ subject }.to raise_error(UrlScrambler::DecodingError)
      end
    end
  end
end
