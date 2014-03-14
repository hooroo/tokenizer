# encoding: utf-8
require 'tokenizer'
module Tokenizer
  describe Tokenizer do
    let(:args) { 'message' }

    describe '.encode' do
      it 'encodes' do
        expect(Encoder).to receive(:encode).with(args)
        Tokenizer.encode('message')
      end
    end

    describe '.decode' do
      it 'decodes' do
        expect(Decoder).to receive(:decode).with(args)
        Tokenizer.decode('message')
      end
    end
  end
end