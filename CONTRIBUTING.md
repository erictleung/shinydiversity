# Contributing Document

Here are some guidelines that will help make contributing more streamlined.
Contributions are welcome :smile:

**Table of Contents**

- [Shiny Applications](#shiny-applications)
- [Making Changes](#making-changes)
- [Pulling Updates](#pulling-updates)
- [Reviewing Changes](#reviewing-changes)
- [R Style](#r-style)

## Shiny Applications

Take a look at RStudio's page for [`shiny`][shiny] for resources, examples, and
more for creating `shiny` applications.

Two places in particular that may be of interest are:

- http://shiny.rstudio.com/tutorial/
- http://shiny.rstudio.com/articles/

[shiny]: http://shiny.rstudio.com/

## Making Changes

**tl;dr** make PRs, no writing to `master`, write good commit messages

If you wish to contribute, please fork this project, make changes on branches,
and create pull requests (PRs) to the main project page.

```shell
# To create a new branch
git checkout -B new-branch

# Step before a pull request, pushing updates to GitHub
git push origin new-branch
```

Please try to write informative `git commit` messages. See [this
page][goodcommit] for seven rules of a great Git commit message.

[goodcommit]: https://chris.beams.io/posts/git-commit/

## Pulling Updates

**tl;dr** setup `upstream` remote to pull updates, ask for git help if needed

Given you forked this repository, you can keep your fork up to date by setting
up the main repository as an "upstream" git remote to update your changes.

```shell
# Setup upstream remote to pull updates from
git remote add upstream https://github.com/erictleung/shinydiversity.git
git remote -v # Should should you have two remotes, your fork and this repo

# Pulling updates from original repository from your fork
git pull --rebase upstream master
```

The last command should not give you any problems, so long as you do not make
any changes to your local copy of the `master` branch.

If you run into git trouble, you can try [Oh shit, git!][osg] for some honest
answers. Otherwise, you can usually find an answer on StackOverflow. Feel free
to comment in the issues, Slack page, or Gitter if run into issues.

[osg]: http://ohshitgit.com/

## Reviewing Changes

When reviewing pull requests, please test the changes locally for non-trivial
changes (e.g. user interface changes or new functionality).

You can do so by using the [steps outlined here][prlocal]. To do this in a
slightly more automated manner, you can modify the `.git/config` within your
fork to do [branch creation and such][autoprpull].

[prlocal]: https://help.github.com/articles/checking-out-pull-requests-locally/
[autoprpull]: https://gist.github.com/piscisaureus/3342247

## R Style

**tl;dr** use `lintr` and `formatR` for format and style, use 80 character width

Code style can be hotly disputed. To reduce any disputes on style and to make it
consistent throughout the project, we'll be using the [`lintr` package][lintr]
to help with some static code analysis.

If you're using RStudio Version > v0.99.206, then `lintr` will automatically be
applied. Otherwise, use the following code when editing code.

```r
# Initial install of lintr
install.packages("lintr")

# Lint your code
library(lintr)
lint("code_to_lint.R")
```

Additionally, please skim through [Hadley Wickham's style guide][advstyle] for
conventions on file names and object names.

In sum,

```
# File names use dashes
bad_name.R
good-name.R
01-also-good.R # If there is order needed

# Object names are short and use underscores
vcr3 # Bad
euclid_dist # Better
```

You can also use the [`formatR` package][formatr] to help with sensible R code
formatting. You can take a look at the [`formatR` homepage][formatrpage] for
some examples on how to use it.

Adhere to your code being 80 characters wide if possible so it is easier to read
and easier to see differences in changes.

[lintr]: https://github.com/jimhester/lintr
[advstyle]: http://adv-r.had.co.nz/Style.html
[formatr]: https://github.com/yihui/formatR
[formatrpage]: https://yihui.name/formatr/
