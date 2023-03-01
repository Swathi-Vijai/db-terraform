variable "rsgrp" {
  type        = string
  description = "Name of the resource group"
  default     = "devops-rg"
}

variable "location" {
  type        = string
  description = "Location for deploying resources"
  default     = "eastus"
}

variable "data_bricks_name" {
  type        = string
  description = "Name of the azure data bricks"
}
variable "instance_pool_name" {
  type        = string
  description = "Name of the azure data bricks instance pool"
}
variable "instance_pool_max_capacity" {
  type        = number
  description = "Maximum Capacity of the azure data bricks instance pool "
}
variable "cluster_name" {
  type        = string
  description = "Name of the azure data bricks cluster"
}
variable "cluster_autotermination_minutes" {
  description = "How many minutes before automatically terminating due to inactivity."
  type        = number
  default     = 60
}
variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
  default     = "Terraform"
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
}

variable "notebook_language" {
  description = "The language of the notebook."
  type        = string
}

variable "tags" {
  type = object({
    created_by       = string
    created_for      = string
    
  })
}