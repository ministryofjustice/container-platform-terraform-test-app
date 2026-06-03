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
  yaml_body = templatefile("${path.module}/manifests/deployment.yaml", {
    image_repository = var.image_repository
    image_tag        = var.image_tag
  })

  depends_on = [
    kubectl_manifest.namespace
  ]
}

resource "kubectl_manifest" "http_route" {
  count = var.enable_httproute ? 1 : 0
  yaml_body = templatefile("${path.module}/manifests/http-route.yaml", {
    gateway_name      = var.gateway_name
    gateway_namespace = var.gateway_namespace
  })

  depends_on = [
    kubectl_manifest.service,
  ]
}

