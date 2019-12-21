provider "oci" {
  region = "us-ashburn-1"
}

resource "oci_core_vcn" "test_vcn" {
    #Required
  cidr_block      = "10.10.0.0/16"
  display_name    = "my-tf-vcn"

  # freeform_tags   = {"Department"= "MyDepartment"}



  #Update following with your Tenancy or Compartment OCID
  compartment_id  = "YOUR COOMPARTMENT OCID or TENANCY OCID"
}
