# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CreateMessageRequest extends Request {
#   method: "sampling/createMessage";
#   params: {
#     messages: SamplingMessage[];
#     /**
#      * The server's preferences for which model to select. The client MAY ignore these preferences.
#      */
#     modelPreferences?: ModelPreferences;
#     /**
#      * An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
#      */
#     systemPrompt?: string;
#     /**
#      * A request to include context from one or more MCP servers (including the caller), to be attached to the prompt. The client MAY ignore this request.
#      */
#     includeContext?: "none" | "thisServer" | "allServers";
#     /**
#      * @TJS-type number
#      */
#     temperature?: number;
#     /**
#      * The maximum number of tokens to sample, as requested by the server. The client MAY choose to sample fewer tokens than requested.
#      */
#     maxTokens: number;
#     stopSequences?: string[];
#     /**
#      * Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
#      */
#     metadata?: object;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A request from the server to sample an LLM via the client. The client has full discretion over which model to select. The client should also inform the user before beginning sampling, to allow them to inspect the request (human in the loop) and decide whether to approve it.
  class CreateMessageRequest < Request
    include ServerRequest

    attr_reader :messages

    # The server's preferences for which model to select. The client MAY ignore these preferences.
    attr_reader :model_preferences

    # An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
    attr_reader :system_prompt

    # A request to include context from one or more MCP servers (including the caller), to be attached to the prompt. The client MAY ignore this request.
    attr_reader :include_context

    attr_reader :temperature

    # The maximum number of tokens to sample, as requested by the server. The client MAY choose to sample fewer tokens than requested.
    attr_reader :max_tokens

    attr_reader :stop_sequences

    # Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
    attr_reader :metadata

    # @param model_preferences [ModelPreferences] (nil)
    #   The server's preferences for which model to select. The client MAY ignore these preferences.
    # @param system_prompt [String] (nil)
    #   An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
    # @param include_context [none, thisServer, allServers] (nil)
    #   A request to include context from one or more MCP servers (including the caller), to be attached to the prompt. The client MAY ignore this request.
    # @param max_tokens [Numeric]
    #   The maximum number of tokens to sample, as requested by the server. The client MAY choose to sample fewer tokens than requested.
    # @param metadata [object] (nil)
    #   Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
    def initialize(messages:, model_preferences: nil, system_prompt: nil, include_context: nil, temperature: nil, max_tokens:, stop_sequences: nil, metadata: nil)
      @messages = messages
      @model_preferences = model_preferences
      @system_prompt = system_prompt
      @include_context = include_context
      @temperature = temperature
      @max_tokens = max_tokens
      @stop_sequences = stop_sequences
      @metadata = metadata
      params = {
        messages: messages,
        modelPreferences: model_preferences,
        systemPrompt: system_prompt,
        includeContext: include_context,
        temperature: temperature,
        maxTokens: max_tokens,
        stopSequences: stop_sequences,
        metadata: metadata,
      }
      super(method: "sampling/createMessage", params:)
    end
  end
end