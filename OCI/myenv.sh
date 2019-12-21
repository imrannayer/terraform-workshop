echo "Setting OCI environment variables for Terraform"
export TF_VAR_tenancy_ocid="tenancy OCID"
export TF_VAR_user_ocid="user OCID"
export TF_VAR_fingerprint="User fingerprint"
export TF_VAR_private_key_path="/path/to/oci/private/key/file"
echo "Setting OCI environment variables for Ansible"
export OCI_TENANCY=$TF_VAR_tenancy_ocid
export OCI_USER_OCID=$TF_VAR_user_ocid
export OCI_USER_FINGERPRINT=$TF_VAR_fingerprint
export OCI_USER_KEY_FILE=$TF_VAR_private_key_path
