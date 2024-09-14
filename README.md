## 1: Sets config to the init.nix.

```bash
sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/Hortasha/nix/main/init.nix
```

## 2: Reun the init. This will setup git and make /etc/nixos/ folder to be equal to repo.

```bash
sudo nixos-rebuild switch
```

## 3: After having pulled the repo. We setup the actual environment.

```bash
sudo nixos-rebuild switch
```
