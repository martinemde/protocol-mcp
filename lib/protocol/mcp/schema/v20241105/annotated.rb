# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Annotated {
#   annotations?: {
#     /**
#      * Describes who the intended customer of this object or data is.
#      * 
#      * It can include multiple entries to indicate content useful for multiple audiences (e.g., `["user", "assistant"]`).
#      */
#     audience?: Role[];
# 
#     /**
#      * Describes how important this data is for operating the server.
#      * 
#      * A value of 1 means "most important," and indicates that the data is
#      * effectively required, while 0 means "least important," and indicates that
#      * the data is entirely optional.
#      *
#      * @TJS-type number
#      * @minimum 0
#      * @maximum 1
#      */
#     priority?: number;
#   }
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Base for objects that include optional annotations for the client. The client can use annotations to inform how objects are used or displayed
  class Annotated
    include Protocol::Mcp::Schema::Type

    schema_attribute :annotations

    attr_reader :attributes

    def initialize(annotations: nil, **kwargs)
      @attributes = { annotations: annotations }.merge(kwargs)
    end
  end
end