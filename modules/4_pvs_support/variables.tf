################################################################
# Copyright 2023 - IBM Corporation. All rights reserved
# SPDX-License-Identifier: Apache-2.0
################################################################

variable "private_key_file" {}
variable "ssh_agent" {}
variable "connection_timeout" {}
variable "rhel_username" {}
variable "bastion_public_ip" {}
variable "openshift_client_tarball" {}
variable "vpc_support_server_ip" {}
variable "openshift_api_url" {}
variable "openshift_user" {}
variable "openshift_pass" {}
variable "kubeconfig_file" {}
variable "cidrs" {}
variable "powervs_machine_cidr" {}
variable "keep_dns" {}
variable "nfs_server" {}
variable "nfs_path" {}
variable "private_network_mtu" {}
variable "cluster_network_mtu" {}
variable "cicd" {}
variable "cicd_disable_defrag" {}
variable "lbs_ips" {}
variable "worker" {
  type = object({ count = number, memory = string, processors = string })
  default = {
    count      = 1
    memory     = "16"
    processors = "1"
  }
  validation {
    condition     = lookup(var.worker, "count", 1) >= 0
    error_message = "The worker.count value must be greater than 0."
  }
  nullable = false
}

