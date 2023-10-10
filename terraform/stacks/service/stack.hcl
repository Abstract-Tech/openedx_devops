#------------------------------------------------------------------------------
# written by: Lawrence McDaniel
#             https://lawrencemcdaniel.com/
#
# date: Feb-2022
#
# usage: create stack-level parameters, exposed to all
#        Terragrunt modules in this enironment.
#------------------------------------------------------------------------------
locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  stack           = local.global_vars.locals.shared_resource_identifier
  stack_namespace = "${local.global_vars.locals.platform_name}-${local.global_vars.locals.platform_region}-${local.global_vars.locals.shared_resource_identifier}"

  # AWS instance sizing
  mysql_instance_class      = "db.t2.small"
  mysql_allocated_storage   = 10

  redis_node_type           = "cache.t2.small"

  # MongoDB EC2 instance sizing
  mongodb_instance_type     = "t3.medium"
  mongodb_allocated_storage = 100
  

  # Bastion EC2 instance sizing
  bastion_instance_type     = "t3.micro"
  bastion_allocated_storage = 50
  

  #----------------------------------------------------------------------------
  # AWS Elastic Kubernetes service
  # Scaling options
  #
  # see: https://aws.amazon.com/ec2/instance-types/
  #----------------------------------------------------------------------------
  kubernetes_version                 = "1.27"
  eks_create_kms_key                 = true
  tags = merge(
    local.global_vars.locals.tags,
    {
      "cookiecutter/stack"             = local.stack
      "cookiecutter/stack_namespace"   = local.stack_namespace
    }
  )
}
