### PROJECT CONFIG ####

hub_project_id = "sdg-hub-project"
fe_project_id = "sdg-fe-project"
be_project_id = "sdg-be-project"

region = "europe-southwest1"


labels = {
  environment = "prod"
  managed_by = "terraform"
  owner = "cristiancasis"
  purpose = "sdg-infra"
  created_by = "pipelines"
  owneremail = "crcasisatgmaildotcom"

}



### VPC ###
vpcs = [
  {
    name = "gc-p-hub-vpc"
    project_id = "sdg-hub-project"
  },
  {
    name = "gc-p-fe-vpc"
    project_id = "sdg-hub-project"
  },
  {
    name = "gc-p-be-vpc"
    project_id = "sdg-hub-project"
  }
]


### SUBNETS ###
subnets = [
  {
    name                  = "gc-p-hub-connectivity"
    cidr                  = "10.100.1.0/24"
    region                = "europe-southwest1"
    private_google_access = true
    vpc_name              = "gc-p-hub-vpc"
    project_id            = "sdg-hub-project"
  },
  {
    name                  = "gc-p-feai"
    cidr                  = "10.102.1.0/24"
    region                = "europe-southwest1"
    private_google_access = true
    vpc_name              = "gc-p-fe-vpc"
    project_id            = "sdg-hub-project"
  },
  {
    name                  = "gc-p-beai"
    cidr                  = "10.101.1.0/24"
    region                = "europe-southwest1"
    private_google_access = true
    vpc_name              = "gc-p-be-vpc"
    project_id            = "sdg-hub-project"
  }
]

proxy_subnets = [
  {
    name       = "gc-p-beia-proxy"
    cidr       = "10.101.2.0/26"
    region     = "europe-southwest1"
    vpc_name   = "gc-p-be-vpc"
    project_id = "sdg-hub-project"
  },
  {
    name       = "gc-p-feai-proxy"
    cidr       = "10.102.2.0/26"
    region     = "europe-southwest1"
    vpc_name   = "gc-p-fe-vpc"
    project_id = "sdg-hub-project"
  }
]

#### FRONTEND APP ####

## CLOUD RUN ##

service_name = "gc-p-feai"
image = "gcr.io/google-samples/hello-app:1.0"
env_vars = {
  "ENV" = "pro"
}
allow_unauthenticated = false