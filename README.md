# Container Platform Terraform Starter Pack

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/container-platform-terraform-starter-pack/badge)](https://github-community.service.justice.gov.uk/repository-standards/container-platform-terraform-starter-pack)

A Terraform module that deploys a simple hello-world application to a Kubernetes cluster. This module deploys a hello-world application that listens on port 8080 and responds to HTTP requests. 

## Usage

```hcl
module "starter_pack" {
  source = "github.com/ministryofjustice/container-platform-terraform-starter-pack?ref=1.0.0"

  # Required: name of the Gateway resource referenced by the HTTPRoute
  gateway_name = "my-gateway"

  # Required: namespace of the Gateway resource referenced by the HTTPRoute
  gateway_namespace = "gateway-system"
}
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `gateway_name` | string | n/a | Name of the Gateway resource for the HTTPRoute to reference |
| `gateway_namespace` | string | n/a | Namespace of the Gateway resource for the HTTPRoute to reference |


## What Gets Deployed

When applied, this module creates:

1. **Namespace**: `starter-pack`
2. **Deployment**: Runs the hello-world Go application
3. **Service**: Exposes the deployment on port 8080
4. **HTTPRoute**: Routes HTTP traffic from the specified Gateway to the Service

The hello-world app responds with a simple HTML page displaying:
- Title: "Hello World"
- Message: "Welcome to the container platform"

## Repository Standards

This repository follows the [Ministry of Justice GitHub Repository Standards](https://github-community.service.justice.gov.uk/repository-standards/guidance).

## License

[MIT License](LICENSE)
