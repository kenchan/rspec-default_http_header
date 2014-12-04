require "rspec/default_http_header/version"

module RSpec
  module DefaultHttpHeader
    extend ActiveSupport::Concern

    HTTP_METHODS = %w(get post put delete patch)

    included do
      let(:default_headers) { {} }

      HTTP_METHODS.each do |m|
        define_method(m) do |path, parameters = nil, headers_or_env = nil|
          super(path, parameters, default_headers.merge(headers_or_env))
        end
      end
    end
  end
end
