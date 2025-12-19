## Add application

1. Create a kustomization file structure of the application

    -   for helm chart application you can use the structure in `platform/sealed-secrets`

    -   for kustomization application you can use the structure in `applications/myapp`

1. place the new applicatyion directory under `applications` directory

1. Create Argocd Application and ImageUpdater resources and store them in one file in `applications/argocd-apps`

1. Update `applications/argocd-apps/kustomization.yaml` to include the new yaml from privouse step


## Add platform service

1. Create a kustomization file structure of the application

    -   for helm chart application you can use the structure in `platform/sealed-secrets`

    -   for kustomization application you can use the structure in `applications/myapp`

1. place the new platform service directory under `platform/<cluster-name>/` directory

1. Create Argocd Application resource and store them in one file in `platform/<cluster-name>/argocd-apps`

1. Update `platform/<cluster-name>/argocd-apps/kustomization.yaml` to include the new yaml from privouse step
