resource "kubectl_manifest" "namespace" {
  yaml_body = templatefile("${path.module}/manifests/namespace.yaml", {
    namespace = var.namespace
  })
  server_side_apply = true
  wait              = true
}

resource "kubectl_manifest" "service" {
  yaml_body = templatefile("${path.module}/manifests/service.yaml", {
    namespace = var.namespace
  })
  server_side_apply = true
  wait              = true

  depends_on = [
    kubectl_manifest.namespace
  ]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/manifests/deployment.yaml", {
    namespace        = var.namespace
    image_repository = var.image_repository
    image_tag        = var.image_tag
  })
  server_side_apply = true
  wait              = true

  depends_on = [
    kubectl_manifest.namespace
  ]
}

resource "kubectl_manifest" "http_route" {
  count = var.enable_httproute ? 1 : 0
  yaml_body = templatefile("${path.module}/manifests/http-route.yaml", {
    gateway_name      = var.gateway_name
    gateway_namespace = var.gateway_namespace
    hostnames         = var.hostnames
    namespace         = var.namespace
  })
  server_side_apply = true
  wait              = true

  depends_on = [
    kubectl_manifest.service,
  ]
}

