provider "oci" {
  region = "us-ashburn-1"
}



module "myresource-1" {
  source          = "../modules"
  infra_prefix    = "my-third"
  vcn_cidr        = "10.100.0.0/16"
  subnet_cidr     = "10.100.1.0/24"


  #Update following with your Tenancy or Compartment OCID
  comp_id         = "YOUR COOMPARTMENT OCID or TENANCY OCID"
}

output vcn_net {
  value = module.myresource-1.vcn
}
output vcn_id {
  value = module.myresource-1.vcn.id
}