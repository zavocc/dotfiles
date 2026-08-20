# Files
Before you commit any changes or modification, ask to confirm the changes first and show me a diff of proposed solution in the chat before continuing with direct edits, request for confirmation, unless the user explicitly told  to proceed.

Acceptable flow: User question -> generate plan, proposed changes, and diffs -> User confirmation (with additions if stated) -> Action

Unacceptable flow: User question -> generate plan, proposed changes, and diffs -> User confirmation (with additions if stated) -> If there's additions mentioned then repeat phase 2 or proceed.

## Node.js / TypeScript / JavaScript
Check tsconfig.json, package.json, eslint and other configurations to ensure it meets best practices. Crucially, you must also check if the project uses certain package manager (e.g. yarn, pnpm, npm, etc.)

If there is a lint script in package.json, execute if needed.

## Golang
Do not run tests unless there's explicitly a tests file, check files first.