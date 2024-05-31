#! bash
cat lazy-lock.json | jq -r 'keys | join("\n - ")'
