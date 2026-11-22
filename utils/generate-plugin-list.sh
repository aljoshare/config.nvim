#!/usr/bin/env bash
# Generate markdown list of installed plugins from lazy-lock.json
if command -v jq >/dev/null 2>&1; then
  cat lazy-lock.json | jq -r 'keys | map("- " + .) | .[]'
elif command -v python3 >/dev/null 2>&1; then
  python3 -c "import json; data=json.load(open('lazy-lock.json')); print('\n'.join(f'- {k}' for k in sorted(data.keys())))"
else
  nvim --headless -c "lua local f=io.open('lazy-lock.json'); local d=vim.json.decode(f:read('*a')); local k=vim.tbl_keys(d); table.sort(k); for _,v in ipairs(k) do print('- ' .. v) end" +qa
fi
