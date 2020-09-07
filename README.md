# role-ec2_launcher

This is a repo of Ansible role to launch or terminate EC2 instances. It supports either public VPC or private VPC, as long as there is a route to reach the private ips on the private VPC.

## Description

In order to use this role, some of the variables are required to be specified or defined, such as **key_name** and **subnet_ids**. For other variables, please overwrite them as your needs.

| Name                         | Value                | Description                        | File              |
| ---                          | ---                  | ---                                | ---               |
| profile                      | default              | AWS profile name                   | defaults/main.yml |
| session_token                | undefined            | temorary session token             |                   |
| account_id                   | undefined            | account id for assumed role        |                   |
| assume_role                  | undefined            | IAM Role for tower to assume       |                   |
| ec2_count                    | 1                    | number of EC2 instances            |                   |
| key_name                     | undefined            | name of your ssh key on AWS        |                   |
| sg_name                      | {{key_name}}_sg      | name of the security group         |                   |
| instance_tag                 | {{key_name}}_test    | tag value for Name of EC2 instance |                   |
| service_tag                  | test_{{key_name}}    | tag value for EmoryApplicatonName  |                   |
| instance_type                | t2.micro             | type of EC2 instance               | defaults/main.yml |
| image_id                     | ami-9cbf9bf9         | AMI id for your OS platform        | defaults/main.yml |
| region                       | us-east-2            | EC2 region of AWS                  | defaults/main.yml |
| vpc_id                       | vpc-bd94a7d5         | id of an existing VPC              | defaults/main.yml |
| subnect_ids                  | []                   | list of subnet ids on the VPC      | defaults/main.yml |
| iam_role                     | undefined            | IAM Role for instance to assume    |                   |
| default_user                 | ec2-user             | default user for ssh               | defaults/main.yml |
| pause_for_up                 | 15                   | seconds to pause for vm coming up  | defaults/main.yml |
| sg_rules                     | ...                  | list of rules of security group    | defaults/main.yml |
| extra_sg_rules               | []                   | list of extra rules of sgroup      | defaults/main.yml |

This role supports 2 different usages for Ansible Core with either permanent credentials or temporary credentials. This role will use the profile to select credentials for Ansible Core. If temporary credentials are used with Ansible Core, **session_token** must be specified via external vars in the command line.

The role requires boto and boto3 installed. It also required Ansible 2.5+ to run. For examples, please check with the playbook links below.

## Status

Tested with images of Ubuntu 16.04, CentOS 7 and RedHat 7 with Ansible 2.6.0 and Python 3.7.4

## See Also
* [Ansible Docs] (http://docs.ansible.com)
* [CentOS EC2 AMI List] (https://wiki.centos.org/Cloud/AWS)
* [Ubuntu EC2 AMI Finder] (https://cloud-images.ubuntu.com/locator/ec2/)
