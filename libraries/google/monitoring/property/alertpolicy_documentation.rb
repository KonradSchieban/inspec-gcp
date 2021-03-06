# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
module GoogleInSpec
  module Monitoring
    module Property
      class AlertPolicyDocumentation
        attr_reader :content

        attr_reader :mime_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @content = args['content']
          @mime_type = args['mimeType']
        end

        def to_s
          "#{@parent_identifier} AlertPolicyDocumentation"
        end
      end
    end
  end
end
