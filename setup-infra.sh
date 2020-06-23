#!/usr/bin/env bash
# Exit if anycommand fails
set -e

CLIENT_NAME=${CLIENT_NAME:=$1}
REGION=${REGION:=europe-west4}
ZONE=${ZONE:=a}

TF_VAR_org_id=<ORG_ID>
TF_VAR_billing_account=<BILLING_ACC_ID>

cd deployments/terraform
terraform init
terraform workspace select ${CLIENT_NAME} || terraform workspace new ${CLIENT_NAME}
terraform apply -var="project_name=${CLIENT_NAME}" -var="billing_account=${TF_VAR_billing_account}" -var="org_id=${TF_VAR_org_id}" -var="zone=${ZONE}" -var="region=${REGION}"
