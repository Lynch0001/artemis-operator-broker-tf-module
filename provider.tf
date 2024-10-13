terraform {
  required_version = ">=1.0"
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "3.2.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.18.1"
    }
    local = {
      source = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

provider "helm" {
  kubernetes {
    token = var.rancher_token
    insecure = true
    host = "${var.rancher_url}/k8s/clusters/${data.rancher2_cluster.cluster.id}"
  }
}

provider "kubernetes" {
  token = var.rancher_token
  insecure = true
  host = "${var.rancher_url}/k8s/clusters/${data.rancher2_cluster.cluster.id}"
}
