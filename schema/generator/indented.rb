module Schema
  class Generator
    class Indented
      def initialize(lines)
        @lines = lines

        yield self if block_given?
      end

      def unindented
        @lines
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
