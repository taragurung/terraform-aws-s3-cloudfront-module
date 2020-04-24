# Terraform Module for hosting static website on AWS S3
Anyone can use this module to host a static website in aws s3 and distribute over cloud using Cloudfront to speed up content delivery.

### Inputs
| input | Description |
| ------ | ------ |
| bucket_name | (Required) Unique name of S3 bucket to host static web content |

# outputs 
| Output | Description |
| ------ | ------ |
| cloudfront_dns | The cloudfront dns, can use this in Route53 to map with your domain |
| cloudfront_distribution_id | AWS Cloudfront distribution id, to help identify the cloudfront distribution|
# Purpose of the module:
The sole purpose is to automate the complete process of creating a AWS S3 bucket for website hosting and distributing it using cloudfront.

# About S3
The module will create a S3 bucket with the name supplied and make it web hosted which means we can easily host static website in S3 bucket.

# About Cloudfront:
This will helpt to distribute static content to different edge location provide by AWS. Here we choose to distribute in all edge locations.






#### Maintainer:
Feel free to message me for suggestions and changes. 
> email: taraprasad336@gmail.com

### How to use the module:
If you check the very top right corner you can see the technical information regarding how to use the module in your script. These is what we do to use this module.

- import the module to your terraform script
- pass the input the module demands, here you need to provide a unique AWS S3 bucket name
- initialize the terraform with ```terraform init```
- ```terraform plan``` to make sure everything is fine
- ```terraform apply```

