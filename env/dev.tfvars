### PROJECT CONFIG ####

hub_project_id = "sdg-hub-project-dev"
fe_project_id = "sdg-fe-project-dev"
be_project_id = "sdg-be-project-dev"

region = "europe-southwest1"


labels = {
  environment = "dev"
  managed_by = "terraform"
  owner = "cristian.casis"
  purpose = "sdg-infra"
  created_by = "pipelines"
  owneremail = "crcasis@gmail.com"

}

### VPC ###
vpcs = [
  {
    name = "gc-d-hub-vpc-dev"
    project_id = "sdg-hub-project-dev"
  },
  {
    name = "gc-d-fe-vpc-dev"
    project_id = "sdg-hub-project-dev"
  },
  {
    name = "gc-d-be-vpc-dev"
    project_id = "sdg-hub-project-dev"
  }
]


### SUBNETS ###
subnets = [
  {
    name                  = "gc-d-hub-connectivity"
    cidr                  = "10.100.1.0/24"
    region                = "europe-southwest1"
    private_google_access = true
    vpc_name              = "gc-d-hub-vpc"
    project_id            = "sdg-hub-project-dev"
  },
  {
    name                  = "gc-d-feai"
    cidr                  = "10.102.1.0/24"
    region                = "europe-southwest1"
    private_google_access = true
    vpc_name              = "gc-d-fe-vpc"
    project_id            = "sdg-hub-project-dev"
  },
  {
    name                  = "gc-d-beai"
    cidr                  = "10.101.1.0/24"
    region                = "europe-southwest1"
    private_google_access = true
    vpc_name              = "gc-d-be-vpc"
    project_id            = "sdg-hub-project-dev"
  }
]

proxy_subnets = [
  {
    name       = "gc-d-beia-proxy"
    cidr       = "10.101.2.0/26"
    region     = "europe-southwest1"
    vpc_name   = "gc-d-be-vpc"
    project_id = "sdg-hub-project-dev"
  },
  {
    name       = "gc-d-feai-proxy"
    cidr       = "10.102.2.0/26"
    region     = "europe-southwest1"
    vpc_name   = "gc-d-fe-vpc"
    project_id = "sdg-hub-project-dev"
  }
]

#### FRONTEND APP ####

## CLOUD RUN ##

service_name = "gc-d-feai"
image = "gcr.io/google-samples/hello-app:1.0" #"gcr.io/sdg-fe-project/gc-d-feai:latest"
allow_unauthenticated = false #remove future
env_vars = {
  "ENV" = "dev"
}
bucket_name = "gc-d-feai-documents"
apps_subnet_self_link = "projects/sdg-hub-project-dev/regions/europe-southwest1/subnetworks/gc-d-feai"
network_self_link = "projects/sdg-hub-project-dev/global/networks/gc-d-fe-vpc"
proxy_subnet_self_link = "projects/sdg-hub-project-dev/regions/europe-southwest1/subnetworks/gc-d-feai-proxy"