module Jekyll
  module Void
    BANGS_KEY = Object.new

    class VoidBlock < Liquid::Block
      @@level = 0

      def initialize(tag_name, text, tokens)
        super
      end

      def render(context)
        context.stack do
          bangs = []
          context[BANGS_KEY] = bangs

          super
          rendered = bangs.join("")
          bangs.clear

          rendered
        end
      end
    end
    class BangBlock < Liquid::Block
      @@level = 0

      def initialize(tag_name, text, tokens)
        super
      end

      def render(context)
        rendered = super

        bangs = context.find_variable(BANGS_KEY)
        unless bangs.nil?
          bangs.push(rendered)
        end

        rendered
      end
    end
  end
end

Liquid::Template.register_tag('void', Jekyll::Void::VoidBlock)
Liquid::Template.register_tag('bang', Jekyll::Void::BangBlock)
