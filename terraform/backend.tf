terraform {
  backend "pg" {
    schema_name = "gitlab"
  }
}
