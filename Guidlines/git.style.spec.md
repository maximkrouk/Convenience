# Git style spec.

## Branches

Branch names should be lowercased.

If you need to build **any complex** brunch **structure**, **use slashes**, neither underscores nor dashes. See the example in the _feature_ brunch details below.

- **master**

  - Main brunch, only for the most stable versions.

    _For example if your project version is 2.4.13 and you are about to start working on the 2.5.0 or even 3.0.0, it's time to merge your 2.4.13 project to this brunch._

- **develop**

  - Brunch from `master`, merge your implemented features here.

- **feature**

  - Brunch from `develop`, you may do here almost anything you want c:

    _Use slashes to determine subfeatures. So the full feature brunch name should be like this:_

    `feature/storage/keychain`

- **release**

  - Brunch from `master`, merge your project here, when it's ready for TestFlight or AppStore deployment.

## Commit messages

Commit messages should start from the uppercase letter.

First word describes the type of the commit, than in square brackets subtype is specified if needed. Leave more detailed description after a colon.

Example: `Registration [GSS-81]: NetworkService docs updated.`

- **Project**

  - structure [struct]

    _Fits for changing project architecture/folder structure._

  - dependency [deps]

    _Fits for adding or removing dependencies, such as pods._

  - documentation [docs]

    _Use that if you want to add or update your project's documentation._

- **@FeatureName**

  - [@TASK_ID]

  - none

    _In case you are not using project management tools._

- **BugFix**

  - [minor]
  - [major]

- **Other**

  - refactoring [refactor]

  - none

    _Your project is messy like shit and you mixed bugfixing with new features? Go ahead!_

  