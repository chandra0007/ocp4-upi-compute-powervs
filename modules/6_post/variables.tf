################################################################
# Copyright 2023 - IBM Corporation. All rights reserved
# SPDX-License-Identifier: Apache-2.0
################################################################

variable "bastion_public_ip" {
  type        = list(string)
  description = "List of bastion public IP addresses"
  default     = ["none"]
}
variable "ssh_agent" {}
variable "private_key_file" {}
variable "powervs_region" {}
variable "powervs_zone" {}
variable "system_type" {}
variable "nfs_server" {}
variable "nfs_path" {}
variable "name_prefix" {}
variable "worker" {}
