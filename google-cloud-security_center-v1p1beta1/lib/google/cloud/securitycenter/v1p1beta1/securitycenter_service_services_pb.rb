# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/securitycenter/v1p1beta1/securitycenter_service.proto for package 'Google.Cloud.SecurityCenter.V1p1beta1'
# Original file comments:
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/cloud/securitycenter/v1p1beta1/securitycenter_service_pb'

module Google
  module Cloud
    module SecurityCenter
      module V1p1beta1
        module SecurityCenter
          # V1p1Beta1 APIs for Security Center service.
          class Service

            include GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.securitycenter.v1p1beta1.SecurityCenter'

            # Creates a source.
            rpc :CreateSource, ::Google::Cloud::SecurityCenter::V1p1beta1::CreateSourceRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::Source
            # Creates a finding. The corresponding source must exist for finding
            # creation to succeed.
            rpc :CreateFinding, ::Google::Cloud::SecurityCenter::V1p1beta1::CreateFindingRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::Finding
            # Creates a notification config.
            rpc :CreateNotificationConfig, ::Google::Cloud::SecurityCenter::V1p1beta1::CreateNotificationConfigRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::NotificationConfig
            # Deletes a notification config.
            rpc :DeleteNotificationConfig, ::Google::Cloud::SecurityCenter::V1p1beta1::DeleteNotificationConfigRequest, ::Google::Protobuf::Empty
            # Gets the access control policy on the specified Source.
            rpc :GetIamPolicy, ::Google::Iam::V1::GetIamPolicyRequest, ::Google::Iam::V1::Policy
            # Gets a notification config.
            rpc :GetNotificationConfig, ::Google::Cloud::SecurityCenter::V1p1beta1::GetNotificationConfigRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::NotificationConfig
            # Gets the settings for an organization.
            rpc :GetOrganizationSettings, ::Google::Cloud::SecurityCenter::V1p1beta1::GetOrganizationSettingsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::OrganizationSettings
            # Gets a source.
            rpc :GetSource, ::Google::Cloud::SecurityCenter::V1p1beta1::GetSourceRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::Source
            # Filters an organization's assets and  groups them by their specified
            # properties.
            rpc :GroupAssets, ::Google::Cloud::SecurityCenter::V1p1beta1::GroupAssetsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::GroupAssetsResponse
            # Filters an organization or source's findings and  groups them by their
            # specified properties.
            #
            # To group across all sources provide a `-` as the source id.
            # Example: /v1p1beta1/organizations/{organization_id}/sources/-/findings
            rpc :GroupFindings, ::Google::Cloud::SecurityCenter::V1p1beta1::GroupFindingsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::GroupFindingsResponse
            # Lists an organization's assets.
            rpc :ListAssets, ::Google::Cloud::SecurityCenter::V1p1beta1::ListAssetsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::ListAssetsResponse
            # Lists an organization or source's findings.
            #
            # To list across all sources provide a `-` as the source id.
            # Example: /v1p1beta1/organizations/{organization_id}/sources/-/findings
            rpc :ListFindings, ::Google::Cloud::SecurityCenter::V1p1beta1::ListFindingsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::ListFindingsResponse
            # Lists notification configs.
            rpc :ListNotificationConfigs, ::Google::Cloud::SecurityCenter::V1p1beta1::ListNotificationConfigsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::ListNotificationConfigsResponse
            # Lists all sources belonging to an organization.
            rpc :ListSources, ::Google::Cloud::SecurityCenter::V1p1beta1::ListSourcesRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::ListSourcesResponse
            # Runs asset discovery. The discovery is tracked with a long-running
            # operation.
            #
            # This API can only be called with limited frequency for an organization. If
            # it is called too frequently the caller will receive a TOO_MANY_REQUESTS
            # error.
            rpc :RunAssetDiscovery, ::Google::Cloud::SecurityCenter::V1p1beta1::RunAssetDiscoveryRequest, ::Google::Longrunning::Operation
            # Updates the state of a finding.
            rpc :SetFindingState, ::Google::Cloud::SecurityCenter::V1p1beta1::SetFindingStateRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::Finding
            # Sets the access control policy on the specified Source.
            rpc :SetIamPolicy, ::Google::Iam::V1::SetIamPolicyRequest, ::Google::Iam::V1::Policy
            # Returns the permissions that a caller has on the specified source.
            rpc :TestIamPermissions, ::Google::Iam::V1::TestIamPermissionsRequest, ::Google::Iam::V1::TestIamPermissionsResponse
            # Creates or updates a finding. The corresponding source must exist for a
            # finding creation to succeed.
            rpc :UpdateFinding, ::Google::Cloud::SecurityCenter::V1p1beta1::UpdateFindingRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::Finding
            # Updates a notification config. The following update
            # fields are allowed: description, pubsub_topic, streaming_config.filter
            rpc :UpdateNotificationConfig, ::Google::Cloud::SecurityCenter::V1p1beta1::UpdateNotificationConfigRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::NotificationConfig
            # Updates an organization's settings.
            rpc :UpdateOrganizationSettings, ::Google::Cloud::SecurityCenter::V1p1beta1::UpdateOrganizationSettingsRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::OrganizationSettings
            # Updates a source.
            rpc :UpdateSource, ::Google::Cloud::SecurityCenter::V1p1beta1::UpdateSourceRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::Source
            # Updates security marks.
            rpc :UpdateSecurityMarks, ::Google::Cloud::SecurityCenter::V1p1beta1::UpdateSecurityMarksRequest, ::Google::Cloud::SecurityCenter::V1p1beta1::SecurityMarks
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
