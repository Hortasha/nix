## 1: Sets config to the init.nix.

```bash
sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/Hortasha/nix/main/init.nix
```

## 2: Reun the init. This will setup git and make /etc/nixos/ folder to be equal to repo.

```bash
sudo nixos-rebuild switch
```

## 3: After having pulled the repo. We setup the actual environment.

### Init cluster with master node

```bash
K3_NAME="<name of node, unique>" K3_ROLE="server" sudo -E HOME=/root nixos-rebuild switch
```

### Another node on the same cluster

Get token

```bash
sudo cat /var/lib/rancher/k3s/server/node-token
```

Create Node

```bash
K3_TOKEN="<token>" K3_IP="<master IP>" K3_NAME="<name of node, unique>" K3_ROLE="server|agent" sudo -E HOME=/root nixos-rebuild switch
```
