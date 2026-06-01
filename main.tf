resource "kubectl_manifest" "namespace" {
  yaml_body = file("${path.module}/manifests/namespace.yaml")
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/manifests/service.yaml")

  depends_on = [
    kubectl_manifest.namespace
  ]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = file("${path.module}/manifests/deployment.yaml")

  depends_on = [
    kubectl_manifest.namespace
  ]
}

resource "kubectl_manifest" "http_route" {
  yaml_body = templatefile("${path.module}/manifests/http-route.yaml", {
    gateway_name      = var.gateway_name
    gateway_namespace = var.gateway_namespace
  })

  depends_on = [
    kubectl_manifest.service,
  ]
}

