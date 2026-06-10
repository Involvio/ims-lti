require 'spec_helper'

module IMS::LTI::SimpleOAuth
  describe Header do
    let(:oauth_options) do
      {
        consumer_key: 'key',
        consumer_secret: 'secret',
        nonce: 'nonce',
        timestamp: '123'
      }
    end

    it 'normalizes the URL scheme and host for signature generation' do
      header = described_class.new(:post, 'HTTP://www.Example.com/launch?b=two', {}, oauth_options)

      expect(header.send(:url)).to eq 'http://www.example.com/launch'
    end

    it 'decodes repeated query params without CGI.parse' do
      header = described_class.new(:post, 'http://www.example.com/launch?b=two&a=2&a=1&space=x+y', {}, oauth_options)

      expect(header.send(:url_params)).to contain_exactly(
        ['a', '1'],
        ['a', '2'],
        ['b', 'two'],
        ['space', 'x y']
      )
    end

    it 'includes decoded query params in the normalized signature params' do
      header = described_class.new(:post, 'http://www.example.com/launch?b=two&a=2&a=1&space=x+y', {}, oauth_options)

      expect(header.send(:normalized_params)).to eq(
        'a=1&a=2&b=two&oauth_consumer_key=key&oauth_nonce=nonce&oauth_signature_method=HMAC-SHA1&oauth_timestamp=123&oauth_version=1.0&space=x%20y'
      )
    end
  end
end
