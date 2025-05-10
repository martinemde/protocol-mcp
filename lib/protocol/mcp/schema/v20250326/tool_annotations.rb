# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ToolAnnotations {
#   /**
#    * A human-readable title for the tool.
#    */
#   title?: string;
# 
#   /**
#    * If true, the tool does not modify its environment.
#    *
#    * Default: false
#    */
#   readOnlyHint?: boolean;
# 
#   /**
#    * If true, the tool may perform destructive updates to its environment.
#    * If false, the tool performs only additive updates.
#    *
#    * (This property is meaningful only when `readOnlyHint == false`)
#    *
#    * Default: true
#    */
#   destructiveHint?: boolean;
# 
#   /**
#    * If true, calling the tool repeatedly with the same arguments
#    * will have no additional effect on the its environment.
#    *
#    * (This property is meaningful only when `readOnlyHint == false`)
#    *
#    * Default: false
#    */
#   idempotentHint?: boolean;
# 
#   /**
#    * If true, this tool may interact with an "open world" of external
#    * entities. If false, the tool's domain of interaction is closed.
#    * For example, the world of a web search tool is open, whereas that
#    * of a memory tool is not.
#    *
#    * Default: true
#    */
#   openWorldHint?: boolean;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Additional properties describing a Tool to clients.
  # 
  # NOTE: all properties in ToolAnnotations are **hints**.
  # They are not guaranteed to provide a faithful description of
  # tool behavior (including descriptive properties like `title`).
  # 
  # Clients should never make tool use decisions based on ToolAnnotations
  # received from untrusted servers.
  class ToolAnnotations

    # A human-readable title for the tool.
    attr_reader :title

    # If true, the tool does not modify its environment.
    # 
    attr_reader :read_only_hint

    # If true, the tool may perform destructive updates to its environment.
    # If false, the tool performs only additive updates.
    # 
    # (This property is meaningful only when `readOnlyHint == false`)
    # 
    attr_reader :destructive_hint

    # If true, calling the tool repeatedly with the same arguments
    # will have no additional effect on the its environment.
    # 
    # (This property is meaningful only when `readOnlyHint == false`)
    # 
    attr_reader :idempotent_hint

    # If true, this tool may interact with an "open world" of external
    # entities. If false, the tool's domain of interaction is closed.
    # For example, the world of a web search tool is open, whereas that
    # of a memory tool is not.
    # 
    attr_reader :open_world_hint

    # @param title [String] (nil) A human-readable title for the tool.
    # @param read_only_hint [Boolean] (false)
    #   If true, the tool does not modify its environment.
    # @param destructive_hint [Boolean] (true)
    #   If true, the tool may perform destructive updates to its environment.
    #   If false, the tool performs only additive updates.
    #   (This property is meaningful only when `readOnlyHint == false`)
    # @param idempotent_hint [Boolean] (false)
    #   If true, calling the tool repeatedly with the same arguments
    #   will have no additional effect on the its environment.
    #   (This property is meaningful only when `readOnlyHint == false`)
    # @param open_world_hint [Boolean] (true)
    #   If true, this tool may interact with an "open world" of external
    #   entities. If false, the tool's domain of interaction is closed.
    #   For example, the world of a web search tool is open, whereas that
    #   of a memory tool is not.
    def initialize(title: nil, read_only_hint: false, destructive_hint: true, idempotent_hint: false, open_world_hint: true)
      @title = title
      @read_only_hint = read_only_hint
      @destructive_hint = destructive_hint
      @idempotent_hint = idempotent_hint
      @open_world_hint = open_world_hint
    end
  end
end