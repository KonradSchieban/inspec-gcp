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
require 'google/sql/property/databaseinstance_settings_backup_configuration'
require 'google/sql/property/databaseinstance_settings_database_flags'
require 'google/sql/property/databaseinstance_settings_ip_configuration'
require 'google/sql/property/databaseinstance_settings_ip_configuration_authorized_networks'
module GoogleInSpec
  module SQL
    module Property
      class DatabaseInstanceSettings
        attr_reader :database_flags

        attr_reader :ip_configuration

        attr_reader :tier

        attr_reader :availability_type

        attr_reader :backup_configuration

        attr_reader :settings_version

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @database_flags = GoogleInSpec::SQL::Property::DatabaseInstanceSettingsDatabaseFlagsArray.parse(args['databaseFlags'], to_s)
          @ip_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceSettingsIpConfiguration.new(args['ipConfiguration'], to_s)
          @tier = args['tier']
          @availability_type = args['availabilityType']
          @backup_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceSettingsBackupConfiguration.new(args['backupConfiguration'], to_s)
          @settings_version = args['settingsVersion']
        end

        def to_s
          "#{@parent_identifier} DatabaseInstanceSettings"
        end
      end
    end
  end
end
