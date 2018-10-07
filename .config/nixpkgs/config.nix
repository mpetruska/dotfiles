
{

  allowUnfree = true;

  packageOverrides = pkgs: rec {
  
    sbt = pkgs.sbt.override {
      jre = pkgs.oraclejdk8;
    };

    scala = pkgs.scala.override {
      jre = pkgs.oraclejdk8;
    };

#   Idea 2018.2.4 does not like this.
#    jetbrains.idea-community = pkgs.jetbrains.idea-community.override {
#      jdk = pkgs.oraclejdk8;
#    };

  };
  
}
