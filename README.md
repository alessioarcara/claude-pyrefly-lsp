# pyrefly-lsp

A Claude Code plugin that runs [Pyrefly](https://pyrefly.org) as the language server for Python (`.py`, `.pyi`): hover, go to definition, find references, symbols, call hierarchy and diagnostics.

[![validate](https://github.com/alessioarcara/claude-pyrefly-lsp/actions/workflows/validate.yml/badge.svg)](https://github.com/alessioarcara/claude-pyrefly-lsp/actions/workflows/validate.yml)

## Requirements

The plugin only tells Claude Code how to start the server; the `pyrefly` binary must be on your `PATH`:

```bash
uv tool install pyrefly
# or
pip install pyrefly
```

## Installation

```bash
claude plugin marketplace add alessioarcara/claude-pyrefly-lsp
claude plugin install pyrefly-lsp@alessioarcara-plugins
```

Then restart Claude Code or run `/reload-plugins`. If `pyrefly` is not on your `PATH`, the plugin says so when a session starts.

If you have the official `pyright-lsp` plugin, disable it, so two servers do not both answer for the same files:

```bash
claude plugin disable pyright-lsp@claude-plugins-official
```

## Type checking mode

In a project with no `pyrefly.toml` (or `[tool.pyrefly]` in `pyproject.toml`), Pyrefly falls back to its `basic` preset, which does not infer the return type of functions without annotations: hover shows `-> Unknown`.

This plugin starts the server with the `default` preset instead, so return types are inferred in every project without a config file. The price is more diagnostics than `basic` reports.

The preset is an option of the plugin (`basic`, `legacy`, `default` or `strict`). To change it:

```bash
echo '{"typeCheckingMode": "basic"}' | claude plugin configure pyrefly-lsp@alessioarcara-plugins --values-stdin
```

The setting applies to the language server only. `pyrefly check` on the command line still follows the project's own config.

## License

MIT
