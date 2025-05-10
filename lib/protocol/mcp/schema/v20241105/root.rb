# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Root {
#   /**
#    * The URI identifying the root. This *must* start with file:// for now.
#    * This restriction may be relaxed in future versions of the protocol to allow
#    * other URI schemes.
#    *
#    * @format uri
#    */
#   uri: string;
#   /**
#    * An optional name for the root. This can be used to provide a human-readable
#    * identifier for the root, which may be useful for display purposes or for
#    * referencing the root in other parts of the application.
#    */
#   name?: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Represents a root directory or file that the server can operate on.
  class Root

    # The URI identifying the root. This *must* start with file:// for now.
    # This restriction may be relaxed in future versions of the protocol to allow
    # other URI schemes.
    attr_reader :uri

    # An optional name for the root. This can be used to provide a human-readable
    # identifier for the root, which may be useful for display purposes or for
    # referencing the root in other parts of the application.
    attr_reader :name

    # @param uri [String]
    #   The URI identifying the root. This *must* start with file:// for now.
    #   This restriction may be relaxed in future versions of the protocol to allow
    #   other URI schemes.
    #   @format uri
    # @param name [String] (nil)
    #   An optional name for the root. This can be used to provide a human-readable
    #   identifier for the root, which may be useful for display purposes or for
    #   referencing the root in other parts of the application.
    def initialize(uri:, name: nil)
      @uri = uri
      @name = name
    end
  end
end