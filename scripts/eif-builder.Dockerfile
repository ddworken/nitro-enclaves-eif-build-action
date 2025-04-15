# amazonlinux:2023.5.20240624.0 linux/amd64
FROM arm64v8/amazonlinux:latest

# Install nitro-cli
RUN dnf install aws-nitro-enclaves-cli aws-nitro-enclaves-cli-devel -y

RUN mkdir /output

# Command to build EIF
ENTRYPOINT ["/bin/bash", "-c", "nitro-cli build-enclave --docker-uri ${DOCKER_IMAGE_TAG}:latest --output-file /output/enclave.eif && nitro-cli describe-eif --eif-path /output/enclave.eif > /output/eif-info.txt"]
