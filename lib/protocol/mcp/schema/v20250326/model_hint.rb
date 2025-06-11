# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ModelHint {
#   /**
#    * A hint for a model name.
#    *
#    * The client SHOULD treat this as a substring of a model name; for example:
#    *  - `claude-3-5-sonnet` should match `claude-3-5-sonnet-20241022`
#    *  - `sonnet` should match `claude-3-5-sonnet-20241022`, `claude-3-sonnet-20240229`, etc.
#    *  - `claude` should match any Claude model
#    *
#    * The client MAY also map the string to a different provider's model name or a different model family, as long as it fills a similar niche; for example:
#    *  - `gemini-1.5-flash` could match `claude-3-haiku-20240307`
#    */
#   name?: string;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Hints to use for model selection.
  # 
  # Keys not declared here are currently left unspecified by the spec and are up
  # to the client to interpret.
  class ModelHint
    include Protocol::Mcp::Schema::Type

    # A hint for a model name.
    # 
    # The client SHOULD treat this as a substring of a model name; for example:
    #  - `claude-3-5-sonnet` should match `claude-3-5-sonnet-20241022`
    #  - `sonnet` should match `claude-3-5-sonnet-20241022`, `claude-3-sonnet-20240229`, etc.
    #  - `claude` should match any Claude model
    # 
    # The client MAY also map the string to a different provider's model name or a different model family, as long as it fills a similar niche; for example:
    #  - `gemini-1.5-flash` could match `claude-3-haiku-20240307`
    schema_attribute :name, optional: true

    attr_reader :attributes

    # @param name [String] (nil) A hint for a model name.
    #   The client SHOULD treat this as a substring of a model name; for example:
    #    - `claude-3-5-sonnet` should match `claude-3-5-sonnet-20241022`
    #    - `sonnet` should match `claude-3-5-sonnet-20241022`, `claude-3-sonnet-20240229`, etc.
    #    - `claude` should match any Claude model
    #   The client MAY also map the string to a different provider's model name or a different model family, as long as it fills a similar niche; for example:
    #    - `gemini-1.5-flash` could match `claude-3-haiku-20240307`
    def initialize(name: nil, **kwargs)
      @attributes = { name: name }.merge(kwargs)
    end
  end
end