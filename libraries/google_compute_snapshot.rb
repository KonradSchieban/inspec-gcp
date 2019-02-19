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
require 'google/compute/property/snapshot_snapshot_encryption_key'
require 'google/compute/property/snapshot_source_disk_encryption_key'

# A provider to manage Google Compute Engine resources.
class Snapshot < GcpResourceBase
  name 'google_compute_snapshot'
  desc 'Snapshot'
  supports platform: 'gcp'

  attr_reader :creation_timestamp
  attr_reader :id
  attr_reader :disk_size_gb
  attr_reader :name
  attr_reader :description
  attr_reader :storage_bytes
  attr_reader :licenses
  attr_reader :labels
  attr_reader :label_fingerprint
  attr_reader :source_disk
  attr_reader :zone
  attr_reader :snapshot_encryption_key
  attr_reader :source_disk_encryption_key

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @id = @fetched['id']
    @disk_size_gb = @fetched['diskSizeGb']
    @name = @fetched['name']
    @description = @fetched['description']
    @storage_bytes = @fetched['storageBytes']
    @licenses = @fetched['licenses']
    @labels = @fetched['labels']
    @label_fingerprint = @fetched['labelFingerprint']
    @source_disk = @fetched['sourceDisk']
    @zone = @fetched['zone']
    @snapshot_encryption_key = GoogleInSpec::Compute::Property::SnapshotSnapshotEncryptionKey.new(@fetched['snapshotEncryptionKey'])
    @source_disk_encryption_key = GoogleInSpec::Compute::Property::SnapshotSourceDiskEncryptionKey.new(@fetched['sourceDiskEncryptionKey'])
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/snapshots/{{name}}'
  end
end
