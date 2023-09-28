terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "pravdorubka1979"

    workspaces {
      name = "ModuleExample"
    }
  }
}