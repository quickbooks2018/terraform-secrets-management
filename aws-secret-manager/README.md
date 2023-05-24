# AWS Secret Manager

- Create a secret in AWS Secret Manager with awscli in json format
```bash
aws secretsmanager create-secret --name "cloudgeeksca-rds-secret" --description "rds secret" --secret-string '{"username":"cloudgeeksca","password":"12345678"}'
```