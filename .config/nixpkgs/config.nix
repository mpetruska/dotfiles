
{

  allowUnfree = true;
  oraclejdk.accept_license = true;

  packageOverrides = pkgs: rec {
  
    sbt = pkgs.sbt.override {
      jre = pkgs.oraclejdk8;
    };

    scala = pkgs.scala.override {
      jre = pkgs.oraclejdk8;
    };

  };
  
}
