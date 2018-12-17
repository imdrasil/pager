require "spec"

require "../src/pager"
require "../src/pager/presenters/bootstrap"
require "../src/pager/collections/array"
require "../src/pager/collections/jennifer"

def array_collection(count, current = 0, per_page = 8)
  Pager::ArrayCollection.new((1..count).to_a, current, per_page)
end

def array_presenter(count, current = 0, per_page = 8, path = "/", visible = Pager.visible_pages)
  Pager::Bootstrap.new(array_collection(count, current, per_page), path, visible)
end

module Spec
  struct SnippetMatchExpectation
    def initialize(@snippet_name : String)
    end

    def match(actual_value : String)
      actual_value == snippet
    end

    def match(actual_value : Pager::Presenter)
      match(actual_value.render)
    end

    def failure_message(actual_value : String)
      "Expected: #{snippet}\n     got: #{actual_value}"
    end

    def failure_message(actual_value : Pager::Presenter)
      failure_message(actual_value.render)
    end

    private def snippet
      File.read(File.join("spec", "fixtures", "#{@snippet_name}.html")).gsub('\n', "")
    end
  end

  module Expectations
    def match_snippet(name)
      SnippetMatchExpectation.new(name)
    end
  end
end

I18n.init
