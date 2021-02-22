resource "spacelift_stack" "azure_subscription" {
  name        = "my-azure-msdn-subscription"
  description = "Testing Spacelift.io with my Azure MSDN subscription"

  repository   = "my-azure-msdn-subscription-spacelift"
  branch       = "main"
  project_root = "azure"

  autodeploy = true
  labels     = ["managed", "depends-on:${data.spacelift_current_stack.this.id}"]
}