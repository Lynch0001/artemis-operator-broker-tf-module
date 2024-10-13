data "rancher2_cluster" "cluster" {
  name = var.cluster
}

data "rancher2_project" "artemis" {
  name = var.project
  cluster_id = data.rancher2_cluster.cluster.id
}

data "rancher2_namespace" "artemis" {
  name = var.namespace
  project_id = data.rancher2_project.artemis.id
}

resource "helm_release" "artemis-broker" {
  depends_on = [data.rancher2_namespace.artemis]
  name       = "artemis-broker"
  chart      = "./charts/artemis-broker"
  namespace  = var.namespace
  values = [
    "./charts/artemis-broker/values.yaml",
    var.extra_values
  ]

  timeout = 180
}
