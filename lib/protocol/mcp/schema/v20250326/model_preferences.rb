# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ModelPreferences {
#   /**
#    * Optional hints to use for model selection.
#    *
#    * If multiple hints are specified, the client MUST evaluate them in order
#    * (such that the first match is taken).
#    *
#    * The client SHOULD prioritize these hints over the numeric priorities, but
#    * MAY still use the priorities to select from ambiguous matches.
#    */
#   hints?: ModelHint[];
# 
#   /**
#    * How much to prioritize cost when selecting a model. A value of 0 means cost
#    * is not important, while a value of 1 means cost is the most important
#    * factor.
#    *
#    * @TJS-type number
#    * @minimum 0
#    * @maximum 1
#    */
#   costPriority?: number;
# 
#   /**
#    * How much to prioritize sampling speed (latency) when selecting a model. A
#    * value of 0 means speed is not important, while a value of 1 means speed is
#    * the most important factor.
#    *
#    * @TJS-type number
#    * @minimum 0
#    * @maximum 1
#    */
#   speedPriority?: number;
# 
#   /**
#    * How much to prioritize intelligence and capabilities when selecting a
#    * model. A value of 0 means intelligence is not important, while a value of 1
#    * means intelligence is the most important factor.
#    *
#    * @TJS-type number
#    * @minimum 0
#    * @maximum 1
#    */
#   intelligencePriority?: number;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's preferences for model selection, requested of the client during sampling.
  # 
  # Because LLMs can vary along multiple dimensions, choosing the "best" model is
  # rarely straightforward.  Different models excel in different areas—some are
  # faster but less capable, others are more capable but more expensive, and so
  # on. This interface allows servers to express their priorities across multiple
  # dimensions to help clients make an appropriate selection for their use case.
  # 
  # These preferences are always advisory. The client MAY ignore them. It is also
  # up to the client to decide how to interpret these preferences and how to
  # balance them against other considerations.
  class ModelPreferences
    include Protocol::Mcp::Schema::Type

    # Optional hints to use for model selection.
    # 
    # If multiple hints are specified, the client MUST evaluate them in order
    # (such that the first match is taken).
    # 
    # The client SHOULD prioritize these hints over the numeric priorities, but
    # MAY still use the priorities to select from ambiguous matches.
    schema_attribute :hints, optional: true

    # How much to prioritize cost when selecting a model. A value of 0 means cost
    # is not important, while a value of 1 means cost is the most important
    # factor.
    schema_attribute :cost_priority, optional: true

    # How much to prioritize sampling speed (latency) when selecting a model. A
    # value of 0 means speed is not important, while a value of 1 means speed is
    # the most important factor.
    schema_attribute :speed_priority, optional: true

    # How much to prioritize intelligence and capabilities when selecting a
    # model. A value of 0 means intelligence is not important, while a value of 1
    # means intelligence is the most important factor.
    schema_attribute :intelligence_priority, optional: true

    attr_reader :attributes

    # @param hints [Array<ModelHint>] (nil) Optional hints to use for model selection.
    #   If multiple hints are specified, the client MUST evaluate them in order
    #   (such that the first match is taken).
    #   The client SHOULD prioritize these hints over the numeric priorities, but
    #   MAY still use the priorities to select from ambiguous matches.
    # @param cost_priority [Numeric] (nil)
    #   How much to prioritize cost when selecting a model. A value of 0 means cost
    #   is not important, while a value of 1 means cost is the most important
    #   factor.
    #   @minimum 0
    #   @maximum 1
    # @param speed_priority [Numeric] (nil)
    #   How much to prioritize sampling speed (latency) when selecting a model. A
    #   value of 0 means speed is not important, while a value of 1 means speed is
    #   the most important factor.
    #   @minimum 0
    #   @maximum 1
    # @param intelligence_priority [Numeric] (nil)
    #   How much to prioritize intelligence and capabilities when selecting a
    #   model. A value of 0 means intelligence is not important, while a value of 1
    #   means intelligence is the most important factor.
    #   @minimum 0
    #   @maximum 1
    def initialize(hints: nil, cost_priority: nil, speed_priority: nil, intelligence_priority: nil, **kwargs)
      @attributes = { hints: hints, costPriority: cost_priority, speedPriority: speed_priority, intelligencePriority: intelligence_priority }.merge(kwargs)
    end
  end
end