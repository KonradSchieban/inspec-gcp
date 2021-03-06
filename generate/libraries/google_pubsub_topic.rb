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
require 'gcp_backend'
require 'google/pubsub/property/topic_message_storage_policy'

# A provider to manage Cloud Pub/Sub resources.
class PubsubTopic < GcpResourceBase
  name 'google_pubsub_topic'
  desc 'Topic'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :kms_key_name
  attr_reader :labels
  attr_reader :message_storage_policy

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @name = name_from_self_link(@fetched['name'])
    @kms_key_name = @fetched['kmsKeyName']
    @labels = @fetched['labels']
    @message_storage_policy = GoogleInSpec::Pubsub::Property::TopicMessageStoragePolicy.new(@fetched['messageStoragePolicy'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Topic #{@params[:name]}"
  end

  def un_parse
    {
      'name' => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      'kms_key_name' => ->(x, _) { x.nil? ? [] : ["its('kms_key_name') { should cmp #{x.inspect} }"] },
      'labels' => ->(x, _) { x.nil? ? [] : x.map { |k, v| "its('labels') { should include(#{k.inspect} => #{v.inspect}) }" } },
      'message_storage_policy' => ->(x, _) { x.nil? ? [] : GoogleInSpec::Pubsub::Property::TopicMessageStoragePolicy.un_parse(x, 'message_storage_policy') },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = 'Topic'

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: 'google_pubsub_topic',
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", 'w') do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    'https://pubsub.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/topics/{{name}}'
  end
end
