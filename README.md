# Homebrew Head-Only
These formulae are unversioned (they have no stable release) so are only available as the latest version from e.g. a version control system.

This tap is deprecated because unversioned formulae provide a terrible UX. You
can still install formulae from it but we don’t accept new ones.

## Why is "head-only" bad?
There are a few problems with head-only software:

* Since there's no stable release, the software is liable to change at any moment. We can't guarantee that head-only software will build reliably or be compatible with other software which builds against it, and that increases our support burden.
* Homebrew's version management and upgrade mechanisms don't work with head-only software.

## What can I do to get this back in Homebrew core?
Contact the software's developer and ask them to tag a stable release. If the software has a stable release and works reliably, feel free to submit a pull request at the main Homebrew repository.

## How do I install these formulae?
`brew install --HEAD homebrew/head-only/<formula>`

Or `brew tap homebrew/head-only` and then `brew install --HEAD <formula>`

Or install via URL (which will not receive updates):

```
brew install --HEAD https://raw.githubusercontent.com/Homebrew/homebrew-head-only/master/<formula>.rb
```

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://github.com/Homebrew/brew/tree/master/docs/README.md).
