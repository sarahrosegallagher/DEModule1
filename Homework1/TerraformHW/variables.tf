variable "credentials" {
    description = "Credentials"
    default = "./my-creds.json"
}


variable "project" {
    description = "Project"
    default = "analog-antler-449004-q7"
}


variable "location" {
    description = "Project Location"
    default = "US"
}


variable "bq_dataset_name" {
    description = "My BigQuery Dataset Name"
    default = "demo_dataset"
  
}

variable "gcs_bucket_name" {
    description = "My Storage Bucket Name"
    default = "terra-bucket-analog-antler-449004-q7"
  
}

variable "gcs_storage_class"{
    description = "Bucket Storage Class"
    default = "STANDARD"
}