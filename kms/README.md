### AWS KMS Encryption

- From aws management console, create a KMS key
- Navigate to Customer managed keys
- set the key alias to cloudgeeks

- KMS Encryption Command Line, encrypt file
```bash
aws kms encrypt --region us-east-1 \
--key-id dae563a2-0691-4c0a-bcbe-0deeb8866bea \
--plaintext fileb://db-creds.yaml-hold \
--output text \
--query CiphertextBlob | base64 \
--decode > db-creds.yaml-encrypted
```

- KMS Decryption Command Line, decrypt file
```bash
aws kms decrypt --region us-east-1 \
--ciphertext-blob fileb://db-creds.yaml-encrypted \
--output text --query Plaintext | base64 --decode  > db-creds.yaml
```
