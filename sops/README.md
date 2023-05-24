# SOPS

- https://github.com/mozilla/sops
- https://github.com/mozilla/sops/releases

- SOPS Installation

```bash
curl -LO -# https://github.com/mozilla/sops/releases/download/v3.7.3/sops-v3.7.3.linux.amd64
mv sops-v3.7.3.linux.amd64 sops
chmod +x sops
mv sops /usr/local/bin/
sops --help
```

--- create a secret file from existing secret yaml file, with SOPS & AWS KMS

```bash
sops --kms arn:aws:kms:us-east-1:079447172711:key/dae563a2-0691-4c0a-bcbe-0deeb8866bea --encrypt secrets.yaml > secrets-encrypt.yaml
```


### Terraform Installation

- https://www.terraform.io/downloads.html

```bash
curl -# -LO https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_arm64.zip
unzip terraform_1.4.6_linux_arm64.zip
mv terraform /usr/local/bin/
terraform --version
```


### Terragrunt Installation

- https://github.com/gruntwork-io/terragrunt/releases

```bash
curl -LO -# https://github.com/gruntwork-io/terragrunt/releases/download/v0.45.15/terragrunt_linux_amd64
mv terragrunt_linux_amd64 terragrunt
chmod +x terragrunt
mv terragrunt /usr/local/bin/
terragrunt --version
```