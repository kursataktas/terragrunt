terraform {
  backend "s3" {}

  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "2.3.3"
    }
  }
}

# Create an arbitrary local resource
data "external" "text" {
  program = ["jq", "-n", "{\"text\": \"[I am a kms-master-key template.]\"}"]
}

output "text" {
  value = data.external.text.result.text
}