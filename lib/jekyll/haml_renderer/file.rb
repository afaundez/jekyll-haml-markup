module Jekyll
  class HamlRenderer
    class File
      def initialize(renderer, filename)
        @renderer = renderer
        @filename = filename
      end

      def parse(content)
        measure_time do
          @template = ::Haml::Engine.new(content) #, :line_numbers => true)
        end

        self
      end

      def render(*args)
        measure_time do
          measure_bytes do
            @template.render(*args)
          end
        end
      end

      def render!(*args)
        measure_time do
          measure_bytes do
            @template = @template.render(*args)
          end
        end
      end

      def warnings
        [] # @template.warnings
      end

      private

      def measure_bytes
        yield.tap do |str|
          @renderer.increment_bytes(@filename, str.bytesize)
        end
      end

      def measure_time
        before = Time.now
        yield
      ensure
        after = Time.now
        @renderer.increment_time(@filename, after - before)
      end
    end
  end
end
