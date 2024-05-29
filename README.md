# homebrew-projects

A catch-all repo to hold [Homebrew](https://brew.sh/) formulae for my projects.

## Context

Homebrew maintains a list of popular packages any user can install. But, it takes a certain amount of [notoriety to be accepted](https://docs.brew.sh/Acceptable-Formulae#niche-or-self-submitted-stuff). Instead, users can create "[taps](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)", which are additional formulae sources that can also be installed. Mine lives here.

This means users can install software using

```
brew install xavdid/projects/some-project-name
```

Or, they can run `brew tap xavdid/projects` and then `brew install some-project-name` at a later date.

## Creating a New Formula (or rebuilding formula after dep upgrade)

There's a justfile recipe. I based the instructions off [this blog post](https://til.simonwillison.net/homebrew/packaging-python-cli-for-homebrew).

See also: [Python for formula authors](https://docs.brew.sh/Python-for-Formula-Authors)

## TODO

- could automate [updating these on release](https://til.simonwillison.net/homebrew/auto-formulas-github-actions)
