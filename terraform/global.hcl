#------------------------------------------------------------------------------
# written by: Lawrence McDaniel
#             https://lawrencemcdaniel.com/
#
# date: Feb-2022
#
# usage: create global parameters, exposed to all
#        Terragrunt modules in this repository.
#------------------------------------------------------------------------------
locals {
  platform_name              = "abzt-openedx"
  platform_region            = "eu"
  shared_resource_identifier = "service"
  shared_resource_namespace  = "abzt-openedx-eu-service"
  root_domain                = "openedx-devops.abzt.de"
  services_subdomain         = "service.openedx-devops.abzt.de"
  aws_region                 = "eu-north-1"
  account_id                 = "278208590461"
  studio_subdomain           = "studio"

  tags = {
    "cookiecutter/global/platform_name"                = local.platform_name
    "cookiecutter/global/platform_region"              = local.platform_region
    "cookiecutter/global/shared_resource_identifier"   = local.shared_resource_identifier
    "cookiecutter/global/shared_resource_namespace"    = local.shared_resource_namespace
    "cookiecutter/global/root_domain"                  = local.root_domain
    "cookiecutter/global/services_subdomain"           = local.services_subdomain
    "cookiecutter/global/aws_region"                   = local.aws_region
  }

}

inputs = {
  platform_name    = local.platform_name
  platform_region  = local.platform_region
  aws_region       = local.aws_region
  account_id       = local.account_id
  root_domain      = local.root_domain
}
