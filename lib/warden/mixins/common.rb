# encoding: utf-8
module Warden
  module Mixins
    module Common

      # Convinience method to access the session
      # :api: public
      def session
        env['rack.session']
      end # session

      # Alias :session to :raw_session since the former will be user API for storing scoped data.
      alias :raw_session :session

      # Convenience method to access the rack request.
      # :api: public
      def request
        @request ||= Rack::Request.new(@env)
      end # request

      # Convenience method to access the rack response. This should be replaced by the
      # actual response returned to the client.
      # :api: public
      def response
        @response ||= Rack::Response.new(@env)
      end # response

      # Convenience method to access the rack request params
      # :api: public
      def params
        request.params
      end # params

      # Resets the session.  By using this non-hash like sessions can
      # be cleared by overwriting this method in a plugin
      # @api overwritable
      def reset_session!
        raw_session.clear
      end
    end # Common
  end # Mixins
end # Warden
