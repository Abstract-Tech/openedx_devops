# Upgrading Your Open edX Devops Repository

We regularly update the [Cookiecutter repository](https://github.com/cookiecutter-openedx/cookiecutter-openedx-devops) that generated this repo. Reasons why the Cookiecutter changes:

- **Version Bumps**. At last count, the Cookiecutter contains more than four dozen underlying software dependencies. These packages, which are mostly Terraform modules and components from the Github Actions Marketplace, require some minimal level of testing as part of bumping the versions that you find in the [Cookiecutter defaults](https://github.com/cookiecutter-openedx/cookiecutter-openedx-devops/blob/main/cookiecutter.json). Terraform code for Kubernetes resources undergoes fairly constant incremental improvements which sometime lead to deprecations and other potentially breaking changes.
- **Feature Additions**. The Cookiecutter feature set rapidly evolved during the first year following its initial release. This has been due, in part, to our own learning curve with regard to best practices for managing Open edX at scale using Kubernetes. It has also been due to fairly rapid evolution of the Kubernetes ecosystem, and the commensurate introduction of quality administrative software and tools that we find helpful for managing this stack. And lastly, it reflects the gradual accumulation of custom features and special needs of the growing community of Open edX platform administrators who rely on this code base.
- **Bug Fixes**. We make mistakes, for a variety of reasons. There are inherent challenges to testing Jinja templating tools as well as the Terraform and Github Actions source code that these Jinja templates generate. Additionally, we occasionally encounter slighly different results when running this code on AWS' many data centers. Sometimes features that worked in the past stop working in the present. That's the nature of working with cloud infrastructure using Terraform. And of course, we sometimes misunderstand how things work until we actually see them running out in the field.

For these reasons, it's a good idea to update your repository around once a month.

## How to Update Your Repository

If you originally created and executed a bash script to generate your repository, then you can simply re-run your script.

Otherwise, you might be interested in the [make.sh](../make.sh) convenience script included in the root of this repo. Be aware that this script **deletes** and then recreates your existing Terraform modules. This 2-step process is necessary to ensure that any deprecated or refactored Terraform files that have been deleted from the Cookiecutter are also deleted from your repository. This script includes a sample set of Cookiecutter parameters, but there are lots more located in [cookiecutter.json](https://github.com/cookiecutter-openedx/cookiecutter-openedx-devops/blob/main/cookiecutter.json), and the documentation for these is located in [Project Generation Options](https://github.com/cookiecutter-openedx/cookiecutter-openedx-devops/blob/main/doc/README.rst).