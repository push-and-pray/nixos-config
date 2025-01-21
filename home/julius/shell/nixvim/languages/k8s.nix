{...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        servers = {
          yamlls = {
            enable = true;
            settings = {
              schemas = {
                kubernetes = "*.{yml,yaml}";
                "https://json.schemastore.org/gitlab-ci" = "*gitlab-ci*.{yml,yaml}";
                "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*compose*.{yml,yaml}";
                "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
              };
            };
          };
        };
      };
    };
  };
}
