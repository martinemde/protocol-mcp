# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CompleteRequest extends Request {
#   method: "completion/complete";
#   params: {
#     ref: PromptReference | ResourceReference;
#     /**
#      * The argument's information
#      */
#     argument: {
#       /**
#        * The name of the argument
#        */
#       name: string;
#       /**
#        * The value of the argument to use for completion matching.
#        */
#       value: string;
#     };
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A request from the client to the server, to ask for completion options.
  class CompleteRequest < Request
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    METHOD = "completion/complete"

    params_attribute :ref

    # The argument's information
    params_attribute :argument

    # @param argument [Hash] The argument's information
    def initialize(ref:, argument:)
      params = {
        ref: ref,
        argument: argument,
      }
      super(method: METHOD, params:)
    end
  end
end