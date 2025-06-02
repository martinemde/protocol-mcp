# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Annotations {
#   /**
#    * Describes who the intended customer of this object or data is.
#    *
#    * It can include multiple entries to indicate content useful for multiple audiences (e.g., `["user", "assistant"]`).
#    */
#   audience?: Role[];
# 
#   /**
#    * Describes how important this data is for operating the server.
#    *
#    * A value of 1 means "most important," and indicates that the data is
#    * effectively required, while 0 means "least important," and indicates that
#    * the data is entirely optional.
#    *
#    * @TJS-type number
#    * @minimum 0
#    * @maximum 1
#    */
#   priority?: number;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Optional annotations for the client. The client can use annotations to inform how objects are used or displayed
  class Annotations
    include Protocol::Mcp::Schema::Type

    # Describes who the intended customer of this object or data is.
    # 
    # It can include multiple entries to indicate content useful for multiple audiences (e.g., `["user", "assistant"]`).
    schema_attribute :audience

    # Describes how important this data is for operating the server.
    # 
    # A value of 1 means "most important," and indicates that the data is
    # effectively required, while 0 means "least important," and indicates that
    # the data is entirely optional.
    schema_attribute :priority

    attr_reader :attributes

    # @param audience [Array<Role>] (nil)
    #   Describes who the intended customer of this object or data is.
    #   It can include multiple entries to indicate content useful for multiple audiences (e.g., `["user", "assistant"]`).
    # @param priority [Numeric] (nil)
    #   Describes how important this data is for operating the server.
    #   A value of 1 means "most important," and indicates that the data is
    #   effectively required, while 0 means "least important," and indicates that
    #   the data is entirely optional.
    #   @minimum 0
    #   @maximum 1
    def initialize(audience: nil, priority: nil, **kwargs)
      @attributes = { audience: audience, priority: priority }.merge(kwargs)
    end
  end
end