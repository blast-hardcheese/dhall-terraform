terraform-dhall
===============

Problem Statement
-----------------
- HCL does not easily support code reuse
- HCL syntax is not used anywhere outside of HCL projects
- HCL permits unconsumed values in specifications, encouraging lack-of-discovery errors

Goals
-----

- [ ] Curated support for [Terraform Providers](https://www.terraform.io/docs/providers/index.html)
  - [ ] Datadog
  - [ ] Pagerduty
  - [x] [Scaleway](./Terraform/Providers/Scaleway.dhall)
