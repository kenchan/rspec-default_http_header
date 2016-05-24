require "rspec/default_http_header/version"

module RSpec
  module DefaultHttpHeader
    extend ActiveSupport::Concern

    HTTP_METHODS = %w(get post put delete patch)

    included do
      let(:default_headers) { {} }

      HTTP_METHODS.each do |m|
        if ActionDispatch::Integration::Session.private_method_defined?(:process_with_kwargs)
          define_method(m) do |path, *args|
            if args[0].respond_to?(:has_key?) && args[0].has_key?(:headers)
              args[0][:headers].merge!(default_headers)
            end

            super(path, *args)
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
