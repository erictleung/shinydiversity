# Contributing Document

Here are some guidelines that will help make contributing more streamlined.
Contributions are welcome :smile:

**Table of Contents**

- [Shiny Applications](#shiny-applications)
- [Making Changes](#making-changes)
- [R Style](#r-style)

## Shiny Applications

Take a look at RStudio's page for [`shiny`][shiny] for resources, examples, and
more for creating `shiny` applications.

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
