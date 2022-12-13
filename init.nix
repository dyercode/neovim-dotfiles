{ pkgs, ... }: {
  home.sessionVariables = { EDITOR = "nvim"; };

  # nixpkgs.config = {
  # packageOverrides = pkgs: {
  # neovim = unstable.neovim;
  # vimPlugins = unstable.vimPlugins;
  # };
  # };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nerdtree
      neoformat
      vim-fish
      vim-airline vim-airline-themes vim-devicons
      vim-fugitive
      ctrlp-vim
      vim-gitgutter
      vim-nix
      nerdtree
      nerdtree-git-plugin
      LanguageClient-neovim
      vim-elm-syntax
      vim-surround vim-repeat
      vim-test
      haskell-vim
      vim-pony
      (pkgs.vimUtils.buildVimPlugin {
        name = "vim-deep-space";
        src = pkgs.fetchFromGitHub {
          owner = "tyrannicaltoucan";
          repo = "vim-deep-space";
          rev = "126d52f4f77877385cd44d983709053d1aab6635";
          sha256 = "RAMgJpUxel5Ks951v1nitW+tFyIC5aIXlgv+vwISJL4=";
        };
      })
            # looks for bsc and bsb executables in build's node_modules.
            # (pkgs.vimUtils.buildVimPlugin {
              # name = "vim-rescript";
              # src = pkgs.fetchFromGitHub {
                # owner = "rescript-lang";
                # repo = "vim-rescript";
                # rev = "76a15d89289829466446d028bf589aae67bd1a7e";
                # sha256 = "aASUXqZD6ytt1vNxQiENDI44iDQ2tCg1DiBp9f7RFoI=";
              # };
            # })
      plenary-nvim nvim-metals nvim-cmp cmp-nvim-lsp cmp-vsnip vim-vsnip
      editorconfig-nvim
    ];
    extraConfig = ''
      ${builtins.readFile ./init.vim}
      if &loadplugins
        ${builtins.readFile ./airline.vim}
        ${builtins.readFile ./nerdtree.vim}
        ${builtins.readFile ./ctrlp.vim}
        ${builtins.readFile ./vimTest.vim}
      lua << EOF
          ${builtins.readFile ./lsp.lua}
      EOF
      endif
    '';
    extraPackages = [
      pkgs.rust-analyzer
      pkgs.temurin-bin-16 # for nvim-metals
    ];
  };

  home.packages = with pkgs; [
    # bs-platform
    # vimPlugins.vim-plug
    powerline-fonts
    nerdfonts
    nodejs
    coursier # for nvim-metals
    haskell-language-server
    elmPackages.elm elmPackages.elm-test elmPackages.elm-format elmPackages.elm-review elmPackages.elm-language-server
  ];
}
