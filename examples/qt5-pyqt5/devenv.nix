{ pkgs, lib, ... }:

{
  toolkits.qt5.enable = true;

  languages.python = {
    enable = true;
    # version = "3.11.3";
  };
}
