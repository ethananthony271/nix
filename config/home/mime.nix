{ pkgs, ... }: {
  xdg.mimeApps = {
    enable = true;
    associations.removed = {
      "application/pdf" = ["draw.desktop"];
    };
    associations.added = {
      "application/pdf" = ["zathura.desktop"];
      "inode/directory" = ["yazi.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["zathura.desktop"];
      "inode/directory" = ["yazi.desktop"];
    };
  };
}
