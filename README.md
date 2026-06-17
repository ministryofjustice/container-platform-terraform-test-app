# Container Platform Terraform Test App 

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/container-platform-terraform-test-app/badge)](https://github-community.service.justice.gov.uk/repository-standards/container-platform-terraform-test-app)

A Terraform module that deploys a simple test application to a Kubernetes cluster. This module deploys a sample Go application that listens on port 8080 and responds to HTTP requests. 

## Usage

```hcl
module "test_app" {
  source = "github.com/ministryofjustice/container-platform-terraform-test-app?ref=1.0.0"

  # Optional: set true to create an HTTPRoute resource
  enable_httproute = true

  # Required when enable_httproute = true: name of the Gateway resource referenced by the HTTPRoute
  gateway_name = "my-gateway"

  # Required when enable_httproute = true: namespace of the Gateway resource referenced by the HTTPRoute
  gateway_namespace = "gateway-system"

  # Required when enable_httproute = true: hostnames for the HTTPRoute
  hostnames = ["test-app.apps.example.com"]

  # Required: container image repository
  image_repository = "557395370360.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/container-platform-terraform-test-app"

  # Optional: override the deployed application tag
  image_tag        = "1.0.0"
}
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `enable_httproute` | bool | `false` | Whether to create an HTTPRoute resource |
| `gateway_name` | string | `""` | Name of the Gateway resource for the HTTPRoute to reference (required when `enable_httproute` is `true`) |
| `gateway_namespace` | string | `""` | Namespace of the Gateway resource for the HTTPRoute to reference (required when `enable_httproute` is `true`) |
| `hostnames` | list(string) | `[]` | Hostnames for the HTTPRoute (required when `enable_httproute` is `true`) |
| `image_repository` | string | n/a | Container image repository |
| `image_tag` | string | `1.0.0` | Container image tag |


## What Gets Deployed

When applied, this module creates:

1. **Namespace**: `test-app`
2. **Deployment**: Runs the test-app Go application
3. **Service**: Exposes the deployment on port 8080
4. **HTTPRoute (optional)**: Routes HTTP traffic from the specified Gateway to the Service when `enable_httproute = true`

The sample app responds with a simple HTML page displaying:
- Title: "Hello World"
- Message: "Welcome to the container platform"

## Repository Standards

This repository follows the [Ministry of Justice GitHub Repository Standards](https://github-community.service.justice.gov.uk/repository-standards/guidance).

## License

[MIT License](LICENSE)
