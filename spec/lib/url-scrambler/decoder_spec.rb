# encoding: utf-8
require 'url_scrambler'

module UrlScrambler
  describe Decoder do
    describe '.decode' do
      let(:encoded_message) { 'gaR0aGlzqWlzIGEgaGFzaA==' }
      let(:message) { { 'this' => 'is a hash'} }

      context 'when the message is decodable' do
        it 'decode the message' do
          expect(Decoder.decode(encoded_message)).to eq message
        end
      end

      context 'when the message is not decodable' do
        it 'returns nil' do
          expect(Decoder.decode('asdmdhga')).to be_nil
        end
      end

      context 'when the message is nil' do
        it 'returns nil' do
          expect(Decoder.decode(nil)).to be_nil
        end
      end
    end
  end
end