provider "oci" {
  region = "us-ashburn-1"
}


data "terraform_remote_state" "vcn" {
  backend = "local"

  config = {
    path = "../A-vcn/terraform.tfstate"
  }
}


#VCN

#Subnet
resource "oci_core_subnet" "test_subnet" {

  cidr_block      = "10.10.1.0/24"
  display_name    = "my-tf-subnet1"

  #Reference VCN created above
  vcn_id          = data.terraform_remote_state.vcn.outputs.vcn_id


  #Update following with your Tenancy or Compartment OCID
  compartment_id  = "YOUR COOMPARTMENT OCID or TENANCY OCID"

}