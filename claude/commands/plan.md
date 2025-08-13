# Claude Code /plan Command

## Overview

The `/plan` command implements a structured 3-step planning approach for feature development, creating organized documentation before implementation.

## Command Format

```
/plan [feature requirements description]
```

## Execution Flow

### 1. Folder Creation

- Create feature folder: `@docs/[feature-name]/`
- All documents will be stored in this folder

### 2. Document Generation Process

#### Step 1: Requirements Document (`requirements.md`)

Create a comprehensive requirements document with:

**Structure:**

- Title: "Requirements Document"
- Introduction: Feature overview, context, objectives
- Requirements (3-5 minimum):
  - User story format: "As a [role], I want [feature], so that [benefit]"
  - Numbered as Requirement 1, 2, etc.
- Acceptance Criteria (4-7 per requirement):
  - Format: "WHEN [condition] THEN the system SHALL [action]"
  - Numbered as 1.1, 1.2, 2.1, etc.
  - Cover validation, data handling, edge cases, performance

**User Checkpoint:** Present document and await confirmation before proceeding

#### Step 2: Design Document (`design.md`)

Create a technical design document with:

**Structure:**

- Title: "Design Document"
- Overview: Design approach summary
- Architecture:
  - Current State Analysis
  - Proposed Architecture
- Components and Interfaces:
  - Major component details
  - Partial code examples
  - Model relationships
- Required Code Examples:
  - Model definitions with validations
  - API endpoint structures
  - Database schema changes
  - Migration examples
- Additional Sections:
  - Data Models
  - Error Handling
  - Testing Strategy
  - Migration Strategy
  - Performance Considerations
  - I18n/L10n Strategy (if applicable)

**User Checkpoint:** Present document and await confirmation before proceeding

#### Step 3: Implementation Tasks (`tasks.md`)

Create an actionable task list with:

**Structure:**

- Title: "Implementation Plan"
- Task Format:
  - Checkbox: `- [ ]`
  - Numbered tasks
  - Subtasks as bullet points
  - Requirement references: `_Requirements: 1.1, 1.2, 4.1_`
- Task Order:
  1. Database migrations
  2. Model updates/creation
  3. API endpoints
  4. Serialization/I18n
  5. Testing
  6. Data migration
  7. Cleanup/deprecation
  8. Documentation
- Coverage: Every acceptance criteria must be addressed

**User Checkpoint:** Present document and await confirmation before proceeding

### 3. Implementation Phase

- Execute tasks sequentially from `tasks.md`
- After each task completion:
  - Run all tests to ensure they pass
  - Run lint and typecheck commands if available
  - Update task status to `[x]` only after tests pass
  - Continue to next task
- Maintain requirement traceability
- **Test Requirements:**
  - All existing tests must continue to pass
  - New tests created must pass
  - No task is considered complete until all tests pass

## Example Usage

```
/plan Add patient behavior assessment feature with forms for collecting behavioral data including favorite toys, play preferences, and social interaction patterns
```

**This creates:**

1. Folder: `@docs/patient-behavior-assessment/`
2. Requirements document with user confirmation
3. Design document with user confirmation
4. Task list with user confirmation
5. Sequential task execution with progress tracking

## Key Principles

- User verification at each document stage
- Full requirement traceability
- Comprehensive test coverage
- Phased implementation approach
- Clear code examples in design phase
- Systematic task execution
