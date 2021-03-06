---
title: About the google_storage_default_object_acl resource
platform: gcp
---

## Syntax
A `google_storage_default_object_acl` is used to test a Google DefaultObjectACL resource

## Examples
```
describe google_storage_default_object_acl(bucket: 'gcp-inspec-storage-bucket', entity: user-email) do
  it { should exist }
  its('role') { should cmp "OWNER" }

  its('bucket') { should eq 'gcp-inspec-storage-bucket' }
  its('email') { should include entity-email.com }
end

describe google_storage_default_object_acl(bucket: 'gcp-inspec-storage-bucket', entity: "allUsers") do
  it { should_not exist }
end
```

### Test that a GCP storage bucket ACL exists

    describe google_storage_default_object_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      it { should exist }
    end

### Test that a GCP storage default object ACL has the expected role (READER, WRITER or OWNER)

    describe google_storage_default_object_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      its('role') { should eq 'OWNER' }
    end

## Properties
Properties that can be accessed from the `google_storage_default_object_acl` resource:


  * `domain`: The domain associated with the entity.

  * `email`: The email address associated with the entity.

  * `entity`: The entity holding the permission, in one of the following forms:   * user-{{userId}}   * user-{{email}} (such as "user-liz@example.com")   * group-{{groupId}}   * group-{{email}} (such as "group-example@googlegroups.com")   * domain-{{domain}} (such as "domain-example.com")   * project-team-{{projectId}}   * allUsers   * allAuthenticatedUsers

  * `entity_id`: The ID for the entity

  * `generation`: The content generation of the object, if applied to an object.

  * `id`: The ID of the access-control entry.

  * `object`: The name of the object, if applied to an object.

  * `project_team`: The project team associated with the entity

    * `project_number`: The project team associated with the entity

    * `team`: The team.

  * `role`: The access permission for the entity.


## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
