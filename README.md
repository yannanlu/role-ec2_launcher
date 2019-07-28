# role-ec2_launcher

This is a repo of Ansible role to launch or terminate EC2 instances. It supports both public VPC or private VPC, as long as there is a route to reach the private ips on the private VPC. It also supports Ansible Core and Ansible Tower. In case you want to use Ansible Tower to provision EC2 instances, make sure to overwrite the value of profile to _tower_ in your Tower template.

## Status

Tested with images of Ubuntu 16.04, CentOS 7 and RedHat 7 with Ansible 2.3.1 and Python2.7

## Description

In order to use this role, some of the variables are required to be specified or defined, such as key_name and subnet_ids. For other variables, please overwrite them as your needs.

| Name                         | Value                | Description                    | File                                 |
| ---                          | ---                  | ---                            | ---                                  |
| ec2_count                    | 1                    | number of EC2 instances        | roles/ec2_launcher/defaults/main.yml |
| key_name                     | undefined            | name of your ssh key on AWS    |                                      |
| sg_name                      | {{key_name}}_sg      | name of the security group     | undefined                            |
| instance_tag                 | {{key_name}}_test    | tag name for your EC2 instance | undefined                            |
| instance_type                | t2.micro             | type of EC2 instance           | roles/ec2_launcher/defaults/main.yml |
| image_id                     | ami-9cbf9bf9         | AMI id for your OS platform    | roles/ec2_launcher/defaults/main.yml |
| profile                      | default              | AWS profile name               | roles/ec2_launcher/defaults/main.yml |
| region                       | us-east-2            | EC2 region of AWS              | roles/ec2_launcher/defaults/main.yml |
| vpc_id                       | vpc-bd94a7d5         | id of an existing VPC          | roles/ec2_launcher/defaults/main.yml |
| subnect_ids                  | []                   | list of subnet ids on the VPC  | roles/ec2_launcher/defaults/main.yml |
| iam_role                     | S3GetRole            | IAM Role for the instance      | roles/ec2_launcher/defaults/main.yml |
| default_user                 | ec2-user             | default user for ssh           | roles/ec2_launcher/defaults/main.yml |
| pause_for_up                 | 15                   | seconds to pause for vm up     | roles/ec2_launcher/defaults/main.yml |
| sg_rules                     | ...                  | list of rules of security group| roles/ec2_launcher/defaults/main.yml |
| extra_sg_rules               | []                   | list of extra rules of sgroup  | roles/ec2_launcher/defaults/main.yml |

If the value of profile is set to _tower_, this role will assume AWS credentials are defined in the envrionment variables. So it will not use profile to select the account.

The role requires boto and boto3 installed.

## Author
Yannan Lu <yannanlu@yahoo.com>

## See Also
* [Ansible Docs] (http://docs.ansible.com)
* [CentOS EC2 AMI List] (https://wiki.centos.org/Cloud/AWS)
* [Ubuntu EC2 AMI Finder] (https://cloud-images.ubuntu.com/locator/ec2/)
