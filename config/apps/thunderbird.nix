{ pkgs, ... }: {

  programs.thunderbird = {
    enable = true;
    # profiles.school = {
    #   name = "du";
    #   isDefault = true;
    # };
  };

  home.packages = with args; {
    thunderbird
  };

}
