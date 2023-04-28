terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.3.1"
    }
  }
}

provider "vsphere" {
  user = "administrator@vsphere.local"
  password = "Azert12345-"
  vsphere_server = "192.168.153.136"
  allow_unverified_ssl = true
}