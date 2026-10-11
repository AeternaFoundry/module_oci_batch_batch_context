variable "batch_batch_contexts" {
  description = <<EOT
Map of batch_batch_contexts, attributes below
Required:
    - compartment_id
    - fleets (block):
        - max_concurrent_tasks (required)
        - name (required)
        - shape (required, block):
            - disk_size_in_gbs (optional)
            - memory_in_gbs (required)
            - ocpus (required)
            - shape_name (optional)
            - type (optional)
        - type (required)
    - network (block):
        - nsg_ids (optional)
        - subnet_id (required)
Optional:
    - defined_tags
    - description
    - display_name
    - entitlements
    - freeform_tags
    - state
    - job_priority_configurations (block):
        - tag_key (required)
        - tag_namespace (required)
        - values (required)
        - weight (required)
    - logging_configuration (block):
        - is_job_task_events_propagation_enabled (optional)
        - log_group_id (required)
        - log_id (required)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    entitlements   = optional(map(string))
    freeform_tags  = optional(map(string))
    state          = optional(string)
    fleets = list(object({
      max_concurrent_tasks = number
      name                 = string
      shape = object({
        disk_size_in_gbs = optional(number)
        memory_in_gbs    = number
        ocpus            = number
        shape_name       = optional(string)
        type             = optional(string)
      })
      type = string
    }))
    network = object({
      nsg_ids   = optional(set(string))
      subnet_id = string
    })
    job_priority_configurations = optional(list(object({
      tag_key       = string
      tag_namespace = string
      values        = map(string)
      weight        = number
    })))
    logging_configuration = optional(object({
      is_job_task_events_propagation_enabled = optional(bool)
      log_group_id                           = string
      log_id                                 = string
      type                                   = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.batch_batch_contexts : (
        length(v.fleets) >= 1
      )
    ])
    error_message = "Each fleets list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_batch_contexts : (
        alltrue([for item in v.fleets : (item.shape.type == null || (contains([for v in ["FIXED_GPU_FLEET_SHAPE"] : lower(v)], lower(item.shape.type))))])
      )
    ])
    error_message = "must be one of: \"FIXED_GPU_FLEET_SHAPE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_batch_contexts : (
        alltrue([for item in v.fleets : (contains([for v in ["SERVICE_MANAGED_FLEET", "SERVICE_MANAGED_GPU_FLEET"] : lower(v)], lower(item.type)))])
      )
    ])
    error_message = "must be one of: \"SERVICE_MANAGED_FLEET\", \"SERVICE_MANAGED_GPU_FLEET\""
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_batch_contexts : (
        v.logging_configuration == null || (contains([for v in ["OCI_LOGGING"] : lower(v)], lower(v.logging_configuration.type)))
      )
    ])
    error_message = "must be one of: \"OCI_LOGGING\""
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_batch_contexts : (
        v.state == null || (contains([for v in ["INACTIVE", "ACTIVE"] : lower(v)], lower(v.state)))
      )
    ])
    error_message = "must be one of: \"INACTIVE\", \"ACTIVE\""
  }
}

