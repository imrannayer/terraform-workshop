provider "oci" {
  region = "us-ashburn-1"
}

module "myresource-1" {
  source          = "../modules"
  infra_prefix    = "my-first"
  vcn_cidr        = "10.10.0.0/16"
  subnet_cidr     = "10.10.1.0/24"

  #Update following with your Tenancy or Compartment OCID
  comp_id         = "YOUR COOMPARTMENT OCID or TENANCY OCID"

}
module "myresource-2" {
  source          = "../modules"
  infra_prefix    = "my-second"
  vcn_cidr        = "10.100.0.0/16"
  subnet_cidr     = "10.100.1.0/24"

  #Update following with your Tenancy or Compartment OCID
  comp_id         = "YOUR COOMPARTMENT OCID or TENANCY OCID"

}
