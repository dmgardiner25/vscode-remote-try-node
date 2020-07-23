# Kitchen-sink image for VS Code - VSO Environments

## 1. Build the image
```
docker build -f kitchensink.Dockerfile .
```
## 2. Run locally
```bash
docker run -it -eGIT_REPO_URL="https://github.com/vsls-contrib/guestbook" -eGIT_PR_NUM=11 -eSESSION_TOKEN="seebelow" -eSESSION_CALLBACK="notneeded" <IMAGE_ID>
```

Where:
- `SESSION_TOKEN` Is an AAD token with a valid audience. You can use the `VS Online: Get Access Token` VS Code command to get a token.
- `SESSION_CALLBACK` Is the endpoint the container will call back to with workspace info.

### (editable) Run locally with editable bootstrap file
```
docker run -it -v $(pwd):/c -eGIT_REPO_URL="https://github.com/vsls-contrib/guestbook" -eGIT_PR_NUM=11 -eSESSION_TOKEN= -eSESSION_CALLBACK= <IMAGE_ID>
```
