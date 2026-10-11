resource "oci_batch_batch_context" "batch_batch_contexts" {
  for_each = var.batch_batch_contexts

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  entitlements   = each.value.entitlements
  freeform_tags  = each.value.freeform_tags
  state          = each.value.state

  dynamic "fleets" {
    for_each = each.value.fleets
    content {
      max_concurrent_tasks = fleets.value.max_concurrent_tasks
      name                 = fleets.value.name
      shape {
        disk_size_in_gbs = fleets.value.shape.disk_size_in_gbs
        memory_in_gbs    = fleets.value.shape.memory_in_gbs
        ocpus            = fleets.value.shape.ocpus
        shape_name       = fleets.value.shape.shape_name
        type             = fleets.value.shape.type
      }
      type = fleets.value.type
    }
  }

  network {
    nsg_ids   = each.value.network.nsg_ids
    subnet_id = each.value.network.subnet_id
  }

  dynamic "job_priority_configurations" {
    for_each = each.value.job_priority_configurations != null ? each.value.job_priority_configurations : []
    content {
      tag_key       = job_priority_configurations.value.tag_key
      tag_namespace = job_priority_configurations.value.tag_namespace
      values        = job_priority_configurations.value.values
      weight        = job_priority_configurations.value.weight
    }
  }

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? [each.value.logging_configuration] : []
    content {
      is_job_task_events_propagation_enabled = logging_configuration.value.is_job_task_events_propagation_enabled
      log_group_id                           = logging_configuration.value.log_group_id
      log_id                                 = logging_configuration.value.log_id
      type                                   = logging_configuration.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

