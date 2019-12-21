provider "oci" {
  region = "us-ashburn-1"
}

#VCN

resource "oci_core_vcn" "test_vcn" {
  cidr_block      = "10.10.0.0/16"
  display_name    = "my-tf-vcn"


  #Update following with your Tenancy or Compartment OCID
  compartment_id  = "YOUR COOMPARTMENT OCID or TENANCY OCID"
}

output vcn_id {
  value = oci_core_vcn.test_vcn.id
}