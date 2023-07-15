# Toolkits

Enable GUI toolkits, like Qt5.

```nix title="devenv.nix"
{ pkgs, ... }:

{
  toolkits.qt5.enable = true;
  
  # For a C++ Qt project, also enable:
  languages.cplusplus.enable = true;
  
  # For a Python Qt project, also enable:
  languages.python.enable = true;
}
```
