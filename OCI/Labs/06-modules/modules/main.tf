variable "comp_id" {
  description = "Required: Tenancy OCID"
}
variable "infra_prefix" {
  description = "Required: VCN Name"
}
variable "vcn_cidr" {
  description = "Required: VCN CIDR"
}
variable "subnet_cidr" {
  description = "Required: VCN CIDR"
}

resource "oci_core_vcn" "test_vcn" {

  compartment_id  = var.comp_id
  cidr_block      = var.vcn_cidr
  display_name    = "${var.infra_prefix}-my-tf-vcn"

}

resource "oci_core_subnet" "test_subnet" {

  compartment_id  = var.comp_id
  cidr_block      = var.subnet_cidr
  display_name    = "${var.infra_prefix}-my-tf-subnet1"
  vcn_id          = oci_core_vcn.test_vcn.id
}

output vcn {
  value = oci_core_vcn.test_vcn
}
