# homebrew-projects

A catch-all repo to hold [Homebrew](https://brew.sh/) formulae for my projects.

## Context

Homebrew maintains a list of popular packages any user can install. But, it takes a certain amount of [notoriety to be accepted](https://docs.brew.sh/Acceptable-Formulae#niche-or-self-submitted-stuff). Instead, users can create "[taps](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)", which are additional formulae sources that can also be installed. Mine lives here.

This means users can install software using

```
brew install xavdid/projects/some-project-name
```

Or, they can run `brew tap xavdid/projects` and then `brew install some-project-name` at a later date.

## Creating a New Formula

Running these steps will generate a fresh, installable formula file. I based the instructions off [this blog post](https://til.simonwillison.net/homebrew/packaging-python-cli-for-homebrew).

```bash
cd /tmp
mkdir create-formula
cd create-formula
venv
pip install YOUR_PACKAGE_NAME homebrew-pypi-poet
poet -f YOUR_PACKAGE_NAME > YOUR_PACKAGE_NAME.rb
cp YOUR_PACKAGE_NAME.rb ~/projects/homebrew-projects/Formula
```

See also: [Python for formula authors](https://docs.brew.sh/Python-for-Formula-Authors)
