{ config, lib, pkgs, ... }:

{
  services = {

    postgresql = {
      enable = true;
      package = pkgs.postgresql_15;
      ensureDatabases = [ "postgres" ];
      enableTCPIP = true;
      port = 5432;
      authentication = pkgs.lib.mkOverride 10 ''
        # type  db   DBuser  auth-method
        local   all  all     trust
        # type  db   DBuser  origin-address  auth-method
        host    all  all     127.0.0.1/32    trust
        host    all  all     ::1/128         trust
      '';
    };
  };
};
