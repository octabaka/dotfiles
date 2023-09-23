return {
  ["rust-analyzer"] = {
    diagnostics = {
      enable = true,
    },
    completion = {
      callable = {
        snippets = "none",
        -- snippets = "fill_arguments"
      },
      postfix = {
        enable = false,
      },
    },
    procMacro = {
      enable = true,
    },
  },
  gopls = {
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = false,
    },
    analyses = {
      assign = true,
      atomic = true,
      bools = true,
      composites = true,
      copylocks = true,
      deepequalerrors = true,
      embed = true,
      errorsas = true,
      fieldalignment = false,
      httpresponse = true,
      ifaceassert = true,
      loopclosure = true,
      lostcancel = true,
      nilfunc = true,
      nilness = true,
      nonewvars = true,
      printf = true,
      shadow = true,
      shift = true,
      simplifycompositelit = true,
      simplifyrange = true,
      simplifyslice = true,
      sortslice = true,
      stdmethods = true,
      stringintconv = true,
      structtag = true,
      testinggoroutine = true,
      tests = true,
      timeformat = true,
      unmarshal = true,
      unreachable = true,
      unsafeptr = true,
      unusedparams = false,
      unusedresult = true,
      unusedvariable = true,
      unusedwrite = true,
      useany = true,
    },
    usePlaceholders = false,
    deepCompletion = false,
    hoverKind = "FullDocumentation",
    linkTarget = "pkg.go.dev",
    vulncheck = "Imports",
  },
  typescript = {
    inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
  javascript = {
    inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
}