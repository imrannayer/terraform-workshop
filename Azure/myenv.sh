#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID="azure_subscription_id"
export ARM_CLIENT_ID="azure_client_id"
export ARM_CLIENT_SECRET="azure_client_secret"
export ARM_TENANT_ID="azure_tenant_id"
echo "Setting environment variables for Ansible"
export AZURE_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
export AZURE_CLIENT_ID=$ARM_CLIENT_ID
export AZURE_SECRET=$ARM_CLIENT_SECRET
export AZURE_TENANT=$ARM_TENANT_ID
