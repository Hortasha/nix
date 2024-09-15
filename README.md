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
NODE_NAME="<name of node, unique>" sudo nixos-rebuild switch
```

### Another node on the same cluster

Get token

```bash
sudo cat /var/lib/rancher/k3s/server/node-token
```

Create Node

```bash
K3S_TOKEN="<token>" K3S_SERVER_IP="<master IP>" NODE_NAME="<name of node, unique>" sudo -E HOME=/root nixos-rebuild switch
```
