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
module Protocol::Mcp::Schema::V20241105
  # A request from the client to the server, to ask for completion options.
  class CompleteRequest < Request
    include ClientRequest

    schema_attribute :ref

    # The argument's information
    schema_attribute :argument

    # @param argument [Hash] The argument's information
    def initialize(ref:, argument:)
      params = {
        ref: ref,
        argument: argument,
      }
      super(method: "completion/complete", params:)
    end
  end
end