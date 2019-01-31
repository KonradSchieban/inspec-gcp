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

title 'Test GCP google_compute_route resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
route = attribute('route', default: {
  "name": "inspec-gcp-route",
  "dest_range": "15.0.0.0/24",
  "next_hop_ip": "10.2.0.1",
  "priority": 100
}, description: 'Compute route description')
gcp_network_name = attribute(:gcp_network_name, default: 'gcp_network_name', description: 'GCP network name')
control 'google_compute_route-1.0' do
  impact 1.0
  title 'google_compute_route resource test'

  describe google_compute_route(project: gcp_project_id, name: route['name']) do
    it { should exist }
    its('dest_range') { should eq route['dest_range'] }
    its('network') { should match /\/#{gcp_network_name}$/ }
    its('next_hop_ip') { should eq route['next_hop_ip'] }
    its('priority') { should eq route['priority'] }
  end

  describe google_compute_route(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
