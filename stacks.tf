resource "spacelift_stack" "azure_subscription" {
  name        = "my-azure-msdn-subscription"
  description = "Testing Spacelift.io with my Azure MSDN subscription"

  repository   = "my-azure-msdn-subscription-spacelift"
  branch       = "main"
  project_root = "azure"

  autodeploy = true
  labels     = ["managed", "depends-on:${data.spacelift_current_stack.this.id}"]
}

resource "spacelift_environment_variable" "azure_tenant_id" {
  stack_id   = spacelift_stack.azure_subscription.id
  name       = "ARM_TENANT_ID"
  value      = local.azure_tenant_id
  write_only = false
}

resource "spacelift_environment_variable" "azure_subscription_id" {
  stack_id   = spacelift_stack.azure_subscription.id
  name       = "ARM_SUBSCRIPTION_ID"
  value      = local.azure_subscription_id
  write_only = false
}