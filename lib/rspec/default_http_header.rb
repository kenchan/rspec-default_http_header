require "rspec/default_http_header/version"

module RSpec
  module DefaultHttpHeader
    extend ActiveSupport::Concern

    HTTP_METHODS = %w(get post put delete patch)

    included do
      let(:default_headers) { {} }

      HTTP_METHODS.each do |m|
        if ActionPack::VERSION::MAJOR >= 5
          define_method(m) do |path, *args, **kwargs|
            kwargs[:headers] = if kwargs.has_key?(:headers)
                                  default_headers.merge(kwargs[:headers])
                                else
                                  default_headers
                                end

            super(path, *args, **kwargs)
          end
        else
          define_method(m) do |path, parameters = nil, headers_or_env = {}|
            super(path, parameters, default_headers.merge(headers_or_env))
          end
        end
      end
    end
  end
end
