## kubeseal

1. **Install kubeseal cli**
    ```bash
    # Fetch the latest sealed-secrets version using GitHub API
    KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)
    # Check if the version was fetched successfully
    if [ -z "$KUBESEAL_VERSION" ]; then
        echo "Failed to fetch the latest KUBESEAL_VERSION"
        exit 1
    fi
    curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz"
    tar -xvzf kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz kubeseal
    sudo install -m 755 kubeseal /usr/local/bin/kubeseal
    ```
1. **Get the encrypting key**
    ```bash
    kubeseal --controller-name=sealed-secrets --controller-namespace=sealed-secrets --fetch-cert | tee ss.key
    ```

1. **Encrypt a secret**
    
    a. Add annotation to the secret file
    ```bash
    # Using yq
    yq '.metadata.annotations."sealedsecrets.bitnami.com/managed" = "true"' secret.yaml

    # or just add the below line in secret annotations
    # sealedsecrets.bitnami.com/managed: "true"
    ```
    b. Run encryption command
    ```bash
    kubeseal --scope cluster-wide --cert ss.key -f secret.yaml -o yaml
    ```