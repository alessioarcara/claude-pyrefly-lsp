#!/bin/sh
# Says so at session start when the server this plugin starts is not installed.
command -v pyrefly >/dev/null 2>&1 && exit 0
printf '%s\n' '{"systemMessage": "pyrefly-lsp: pyrefly is not on PATH, so the Python language server cannot start. Install it with: uv tool install pyrefly (or: pip install pyrefly)"}'
