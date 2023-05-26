target_iam_account = {
  dev     = "arn:aws:iam::073934022795:role/hcs-deployment"
  nonprod = "arn:aws:iam::024329120042:role/hcs-deployment"
}

dns_account_deploy_role = {
  dev     = "arn:aws:iam::330629053665:role/hcs-deployment"
  nonprod = "arn:aws:iam::335925085126:role/hcs-deployment"
}

cluster_name = {
  dev     = "cicd-dev-gitlab-cluster"
  nonprod = "cicd-nonprod-gitlab-cluster"
}

engineering_domain = {
  dev     = "engineering-dev.dwpcloud.uk"
  nonprod = "engineering.dwpcloud.uk"
}

dns_manager_role = "engineering-dns-manager"
#cert_manager_role = "eksctl-cert-manager-role"

cert_manager_role = {
  nonprod = "cicd-nonprod-gitlab-cluster-cert-manager"
  dev     = "cicd-dev-gitlab-cluster-cert-manager"
}

admin_list = {
  dev     = "330629053665"
  nonprod = "763178938030"
}

ec2_read_role_name             = "ec2-read-role"
ec2_read_iam_policy_name       = "ec2-describe-instances-policy"
aws_account_secure_development = "103012667645"

tag_environment = {
  dev     = "DT_Tooling"
  test    = "DT_Tooling"
  nonprod = "SP_Tooling"
}

s3_bucket_name = {
  dev     = "dwp-hcs-gitlab-runner-dev-fluentbit-logs"
  nonprod = "dwp-hcs-gitlab-runner-fluentbit-logs"
}

kinesis_firehose_delivery_stream = {
  dev     = "dwp-hcs-gitlab-runner-dev-firehose-ds"
  nonprod = "dwp-hcs-gitlab-runner-firehose-ds"
}

firehose_role = {
  dev     = "dwp—hcs-fluentbit-dev-firehose_role"
  nonprod = "dwp—hcs-fluentbit-firehose_role"

}