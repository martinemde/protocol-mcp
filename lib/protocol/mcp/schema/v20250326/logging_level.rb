# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export type LoggingLevel =
#   | "debug"
#   | "info"
#   | "notice"
#   | "warning"
#   | "error"
#   | "critical"
#   | "alert"
#   | "emergency";
# ```
module Protocol::Mcp::Schema::V20250326
  # The severity of a log message.
  # 
  # These map to syslog message severities, as specified in RFC-5424:
  # https://datatracker.ietf.org/doc/html/rfc5424#section-6.2.1
  module LoggingLevel
    # Type alias: | "debug"
    #   | "info"
    #   | "notice"
    #   | "warning"
    #   | "error"
    #   | "critical"
    #   | "alert"
    #   | "emergency"
  end
end