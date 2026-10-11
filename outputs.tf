output "batch_batch_contexts_id" {
  description = "Map of id values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no id are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "batch_batch_contexts_compartment_id" {
  description = "Map of compartment_id values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no compartment_id are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "batch_batch_contexts_defined_tags" {
  description = "Map of defined_tags values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no defined_tags are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "batch_batch_contexts_description" {
  description = "Map of description values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no description are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.description if v.description != null && length(v.description) > 0 }
}
output "batch_batch_contexts_display_name" {
  description = "Map of display_name values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no display_name are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "batch_batch_contexts_entitlements" {
  description = "Map of entitlements values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no entitlements are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.entitlements if v.entitlements != null && length(v.entitlements) > 0 }
}
output "batch_batch_contexts_fleets" {
  description = "Map of fleets values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no fleets are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.fleets if v.fleets != null && length(v.fleets) > 0 }
}
output "batch_batch_contexts_freeform_tags" {
  description = "Map of freeform_tags values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "batch_batch_contexts_job_priority_configurations" {
  description = "Map of job_priority_configurations values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no job_priority_configurations are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.job_priority_configurations if v.job_priority_configurations != null && length(v.job_priority_configurations) > 0 }
}
output "batch_batch_contexts_lifecycle_details" {
  description = "Map of lifecycle_details values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "batch_batch_contexts_logging_configuration" {
  description = "Map of logging_configuration values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no logging_configuration are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => one(v.logging_configuration) if v.logging_configuration != null && length(v.logging_configuration) > 0 }
}
output "batch_batch_contexts_network" {
  description = "Map of network values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no network are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => one(v.network) if v.network != null && length(v.network) > 0 }
}
output "batch_batch_contexts_state" {
  description = "Map of state values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no state are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.state if v.state != null && length(v.state) > 0 }
}
output "batch_batch_contexts_system_tags" {
  description = "Map of system_tags values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no system_tags are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "batch_batch_contexts_time_created" {
  description = "Map of time_created values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no time_created are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "batch_batch_contexts_time_updated" {
  description = "Map of time_updated values across all batch_batch_contexts, keyed the same as var.batch_batch_contexts except keys with no time_updated are omitted"
  value       = { for k, v in oci_batch_batch_context.batch_batch_contexts : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

