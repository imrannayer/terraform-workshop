provider "oci" {
  region = "us-ashburn-1"
}
provider "oci" {
  region = "us-phoenix-1"
  alias = "phx"
}


resource "oci_core_vcn" "test_vcn_ashburn" {
    #Required
  cidr_block      = "10.10.0.0/16"
  display_name    = "my-tf-vcn-ashburn"

  #Update following with your Tenancy or Compartment OCID
  compartment_id  = "YOUR COOMPARTMENT OCID or TENANCY OCID"
}


resource "oci_core_vcn" "test_vcn_phx" {
  provider = "oci.phx"


  cidr_block      = "10.10.0.0/16"
  display_name    = "my-tf-vcn-phx"

  #Update following with your Tenancy or Compartment OCID
  compartment_id  = "YOUR COOMPARTMENT OCID or TENANCY OCID"
}
