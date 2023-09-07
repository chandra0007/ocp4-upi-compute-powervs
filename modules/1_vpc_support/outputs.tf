################################################################
# Copyright 2023 - IBM Corporation. All rights reserved
# SPDX-License-Identifier: Apache-2.0
################################################################

output "vpc_check_key" {
  value = module.keys.vpc_check_key
}

output "vpc_support_server_ip" {
  value = module.vsi.vpc_support_server_ip
}

output "vpc_crn" {
  value = data.ibm_is_vpc.vpc.crn
}

output "transit_gateway_id" {
  value = module.transit_gateway[0].new_tg
}
