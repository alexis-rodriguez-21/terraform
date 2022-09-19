# Terraform
#Creacion de recursos con Terraform

#Get Started

#Oracle Linux 7.9

#Pakage arm64

#take the link from the terraform page

$ wget https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_arm64.zip

$ unzip terraform_1.2.9_linux_arm64.zip

#output ls -la
- terraform
- .terraform.d

$ sudo mv terraform /usr/local/bin

$ terraform -version

#output 
- Terraform v1.2.9
- on linux_arm64


#create rsa key

$ mkdir $HOME/.oci

$ openssl genrsa -out $HOME/.oci/terraform-rsa.pem 2048

$ chmod 600 $HOME/.oci/terraform-rsa.pem

$ openssl rsa -pubout -in $HOME/.oci/terraform-rsa.pem -out $HOME/.oci/terraform-rsa-public.pem

$ cat $HOME/.oci/terraform-rsa-public.pem

#copy public key

#add api key in oci

#paste public key

#create.


#create terraform variables

export TF_VAR_tenancy_ocid=<#YOUR TENANCY OCID#>

export TF_VAR_user_ocid=<#YOUR USER OCID#>

export TF_VAR_private_key_path=$HOME/.oci/terraform-rsa.pem

export TF_VAR_region=<#NAME REGION for example: us-ashburn-1 #>

export TF_VAR_fingerprint=<#YOUR FINGERPRINT of the api key created#>



$ terraform init

#output
#Terraform has been successfully initialized!

#You may now begin working with Terraform. Try running "terraform plan" to see
#any changes that are required for your infrastructure. All Terraform commands
#should now work.

#If you ever set or change modules or backend configuration for Terraform,
#rerun this command to reinitialize your working directory. If you forget, other
#commands will detect it and remind you to do so if necessary.


