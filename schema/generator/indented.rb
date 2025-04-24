module Schema
  class Generator
    class Indented
      def initialize(lines)
        @lines = lines
      end

      def <<(line)
        if line.empty?
          @lines << ""
        else
          @lines << "  #{line}"
        end
      end
    end
  end
end
