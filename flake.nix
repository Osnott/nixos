{
  description = "osnott's nixos configuration!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # system
    systems.url = "github:nix-systems/default-linux";

    # nvchad starter
    custom-nvchad-starter.url = "github:Osnott/nvchad";
    custom-nvchad-starter.flake = false;

    # nvchad4nix
    nvchad4nix.url = "github:nix-community/nix4nvchad";
    nvchad4nix.inputs.nixpkgs.follows = "nixpkgs";
    nvchad4nix.inputs.nvchad-starter.follows = "custom-nvchad-starter";

    # flux
    flux.url = "github:IogaMaster/flux";
    flux.inputs.nixpkgs.follows = "nixpkgs-stable";

    # pre-commit hooks
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );

    forAllSystems = f: nixpkgs.lib.genAttrs (import systems) (system: f pkgsFor.${system});

    hooks = import ./hooks {inherit lib;};
  in {
    inherit lib;
    # custom packages
    packages = forAllSystems (pkgs: import ./pkgs {inherit pkgs;});

    # formatter
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # checks (pre-commit hooks)
    checks = forAllSystems (pkgs: {
      pre-commit-check = inputs.pre-commit-hooks.lib.${pkgs.system}.run hooks;
    });

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        inherit (self.checks.${pkgs.system}.pre-commit-check) shellHook;
        buildInputs = self.checks.${pkgs.system}.pre-commit-check.enabledPackages;
      };
    });

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      taffy = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main nixos configuration file <
          ./hosts/taffy
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "osnott@taffy" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main home-manager configuration file <
          ./home/osnott/taffy.nix
          ./home/osnott/nixpkgs.nix
        ];
      };
    };
  };
}
