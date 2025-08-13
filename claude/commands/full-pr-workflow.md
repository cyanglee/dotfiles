Execute complete PR creation workflow:

1. **Preparation Phase:**
   - Ensure all changes are committed
   - Run full test suite: npm test
   - Run linting: npm run lint
   - Check for any merge conflicts with main

2. **Branch Management:**
   - Create descriptive branch name following conventions
   - Push branch to remote repository
   - Verify branch protection rules compliance

3. **PR Creation:**
   - Generate comprehensive PR description including:
     - Summary of changes made
     - Testing performed and results
     - Screenshots for UI changes
     - Breaking changes or migration notes
   - Link related issues using GitHub keywords
   - Add appropriate labels and reviewers
   - Set PR as draft if still in progress

4. **Post-Creation Tasks:**
   - Verify CI/CD pipeline triggers correctly
   - Monitor for any failing checks
   - Notify team members via appropriate channels
   - Provide PR URL for easy access
