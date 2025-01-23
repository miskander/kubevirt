name: Manual Make Workflow

on:
  workflow_dispatch: # Allows manual triggering of the workflow

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    env: # Set environment variables globally for all steps
      DOCKER_PREFIX: ghcr.io/miskander/kubevirt
      DOCKER_TAG: ${{ github.sha }}
      PULLER_TIMEOUT: 2000

    steps:      
      - name: Checkout code
        uses: actions/checkout@v3      
      - name: Run make
        run: make
        retry: 2      
      - name: Run make push
        run: make push
        retry: 2      
      - name: Run make manifests
        run: make manifests
        retry: 2
