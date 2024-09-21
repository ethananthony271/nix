{ pkgs, ... }: {

  xdg.desktopEntries = {
    zathura = {
      name = "Zathura";
      genericName = "Document Viewer";
      exec = "zathura %f";
      terminal = false;
      categories = [ "Office" "Viewer" ];
      mimeType = [ "application/pdf" ];
    };
  };

  home.packages = with pkgs; [
    zathura
  ];

}
