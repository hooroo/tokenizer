# encoding: utf-8
require 'url_scrambler'

module UrlScrambler
  describe Decoder do
    describe '.decode' do
      let(:encoded_message) { 'gaR0aGlzqWlzIGEgaGFzaA==' }
      let(:message) { { 'this' => 'is a hash'} }

      it 'decode the message' do
        expect(Decoder.decode(encoded_message)).to eq message
      end
    end
  end
end