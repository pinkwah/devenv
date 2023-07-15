{ pkgs, config, lib, ... }:

let
  cfg = config.toolkits.qt5;
  python = if config.languages.python.enable then config.languages.python.package else null;
  extraPackages = if config.languages.cplusplus.enable then [ pkgs.gnumake ] else [ ];
in
{
  options.toolkits.qt5 = {
    enable = lib.mkEnableOption "packages for Qt5 development";
    pythonPackage = lib.mkOption {
      type = lib.types.package;
      defaultText = "pkgs.python310Packages.pyqt5";
      description = ''
        The Python Qt5 package to use.
        The package is by default pyqt5 built for `languages.python.package`.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    toolkits.qt5.pythonPackage = lib.mkDefault (if python != null then python.pkgs.pyqt5 else null);

    packages = (
      [
        pkgs.qt5.qtbase
        pkgs.qt5.qtwayland
        pkgs.qt5.qtx11extras
      ] ++ extraPackages ++ (lib.optional (cfg.pythonPackage != null) cfg.pythonPackage)
    );

    env.QT_PLUGIN_PATH = "${config.env.DEVENV_PROFILE}/${pkgs.qt5.qtbase.qtPluginPrefix}";
    env.QMAKESPEC = if pkgs.stdenv.isLinux then "linux-clang" else null;
  };
}
