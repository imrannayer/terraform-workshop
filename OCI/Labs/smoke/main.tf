variable "tenancy_ocid" {}

provider "oci" {
  region = "us-ashburn-1"
}

data "oci_identity_availability_domains" "MyAd" {
  compartment_id = "${var.tenancy_ocid}"
}

data "oci_core_images" "test_images" {
  #Required
  compartment_id = "${var.tenancy_ocid}"

  #Optional
  #   display_name     = "${var.image_display_name}"
  operating_system = "Oracle Linux"

  operating_system_version = "7.5"

  #   shape                    = "${var.image_shape}"
  #   state                    = "${var.image_state}"
}

output "oci_img_id" {
  value = "${lookup(data.oci_core_images.test_images.images[0],"id")}"
}

output "list_oci_ad" {
  value = "${data.oci_identity_availability_domains.MyAd.availability_domains}"
}