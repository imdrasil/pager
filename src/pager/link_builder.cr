require "uri"

module Pager
  class LinkBuilder
    getter pattern : String

    def initialize(path : String)
      uri = URI.parse(path)
      @pattern =
        if uri.query
          path + "&page=%s"
        else
          path + "?page=%s"
        end
    end

    def build(page : Int)
      pattern % {page}
    end

    def build_disabled
      "#"
    end
  end
end
