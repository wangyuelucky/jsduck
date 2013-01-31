require "jsduck/tag/tag"

module JsDuck::Tag
  # Implementation of @method tag.
  class Method < Tag
    def initialize
      @pattern = "method"
      @key = :method
      @member_type = {:name => :method, :category => :method_like}
    end

    # @method name ...
    def parse_doc(p)
      {
        :tagname => :method,
        :name => p.hw.ident,
      }
    end

    # Onle sets the name when it's actually specified.
    # Otherwise we might overwrite name coming from @constructor.
    def process_doc(h, tags, pos)
      h[:name] = tags[0][:name] if tags[0][:name]
    end
  end
end
