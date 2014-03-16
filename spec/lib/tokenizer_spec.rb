# encoding: utf-8
require 'url_scrambler'
module UrlScrambler
  describe UrlScrambler do
    let(:args) { 'message' }

    describe '.encode' do
      it 'encodes' do
        expect(Encoder).to receive(:encode).with(args)
        UrlScrambler.encode('message')
      end
    end

    describe '.decode' do
      it 'decodes' do
        expect(Decoder).to receive(:decode).with(args)
        UrlScrambler.decode('message')
      end
    end
  end
end