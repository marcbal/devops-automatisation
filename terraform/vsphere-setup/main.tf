resource "vsphere_datacenter" "datacenter" {
  name = "datacenter"
}


resource "vsphere_compute_cluster" "compute_cluster" {
  name = "terraform-compute-cluster-test"
  datacenter_id = vsphere_datacenter.datacenter.moid

  drs_enabled = true
  drs_automation_level = "fullyAutomated"
  host_system_ids = [
    vsphere_host.esxi1_h.id,
    vsphere_host.esxi2_h.id
  ]

  ha_enabled = true
  depends_on = [
    vsphere_datacenter.datacenter
  ]
}


data "vsphere_host_thumbprint" "esxi1_tp" {
  address = "192.168.153.129"
  insecure = true
}

resource "vsphere_host" "esxi1_h" {
  hostname = data.vsphere_host_thumbprint.esxi1_tp.address
  username = "root"
  password = "Azert12345-"
  thumbprint = data.vsphere_host_thumbprint.esxi1_tp.id
  datacenter = vsphere_datacenter.datacenter.moid
}

data "vsphere_host_thumbprint" "esxi2_tp" {
  address = "192.168.153.131"
  insecure = true
}

resource "vsphere_host" "esxi2_h" {
  hostname = data.vsphere_host_thumbprint.esxi2_tp.address
  username = "root"
  password = "Azert12345-"
  thumbprint = data.vsphere_host_thumbprint.esxi2_tp.id
  datacenter = vsphere_datacenter.datacenter.moid
}
