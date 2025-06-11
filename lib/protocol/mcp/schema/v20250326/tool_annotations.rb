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
    include Protocol::Mcp::Schema::Type

    # A human-readable title for the tool.
    schema_attribute :title, optional: true

    # If true, the tool does not modify its environment.
    # 
    schema_attribute :read_only_hint, optional: true

    # If true, the tool may perform destructive updates to its environment.
    # If false, the tool performs only additive updates.
    # 
    # (This property is meaningful only when `readOnlyHint == false`)
    # 
    schema_attribute :destructive_hint, optional: true

    # If true, calling the tool repeatedly with the same arguments
    # will have no additional effect on the its environment.
    # 
    # (This property is meaningful only when `readOnlyHint == false`)
    # 
    schema_attribute :idempotent_hint, optional: true

    # If true, this tool may interact with an "open world" of external
    # entities. If false, the tool's domain of interaction is closed.
    # For example, the world of a web search tool is open, whereas that
    # of a memory tool is not.
    # 
    schema_attribute :open_world_hint, optional: true

    attr_reader :attributes

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
    def initialize(title: nil, read_only_hint: false, destructive_hint: true, idempotent_hint: false, open_world_hint: true, **kwargs)
      @attributes = { title: title, readOnlyHint: read_only_hint, destructiveHint: destructive_hint, idempotentHint: idempotent_hint, openWorldHint: open_world_hint }.merge(kwargs)
    end
  end
end