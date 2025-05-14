{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "compile-sourcemod-plugins";
  targetPkgs = pkgs: (with pkgs; [
    stdenv.cc.cc.lib
  ]);
  runScript = "bash";
}).env
