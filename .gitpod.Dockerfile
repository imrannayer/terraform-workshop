FROM gitpod/workspace-full

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install AWS CLI version 2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install

# Install Google Cloud SDK
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-341.0.0-linux-x86_64.tar.gz -o "google-cloud-sdk.tar.gz" && \
    tar -xf google-cloud-sdk.tar.gz && \
    ./google-cloud-sdk/install.sh --path-update true -q

# Install Terraform 0.14.11
RUN sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    sudo apt-get update && sudo apt-get install terraform=0.14.11

# Apply user-specific settings
# ENV ...
