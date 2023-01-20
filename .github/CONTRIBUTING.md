---
editor_options: 
  markdown: 
    wrap: sentence
---

# Contributing to chemboxR

This outlines how to propose a change to chemboxR.
For more detailed info about contributing to this, and other tidyverse packages, please see the [**development contributing guide**](https://rstd.io/tidy-contrib).

Contributions are welcome, and they are greatly appreciated!
Every little bit helps, and credit will always be given.

## Types of Contributions

### Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation directly using the GitHub web interface, as long as the changes are made in the *source* file.
This generally means you'll need to edit [roxygen2 comments](https://roxygen2.r-lib.org/articles/roxygen2.html) in an `.R`, not a `.Rd` file.
You can find the `.R` file that generates the `.Rd` by reading the comment in the first line.

### Report Bugs

Report bugs at <https://github.com/UBC-MDS/chemboxR/issues>

If you are reporting a bug, please include:

-   Your operating system name and version.
-   Any details about your local setup that might be helpful in troubleshooting.
-   Detailed steps to reproduce the bug.

### Fix bugs

Look through the GitHub issues for bugs.
Anything tagged with "bug" and "help wanted" is open to whoever wants to implement it.

### Implement Features

Look through the GitHub issues for features.
Anything tagged with "enhancement" and "help wanted" is open to whoever wants to implement it.

### Write Documentation

You can never have enough documentation!
Please feel free to contribute to any part of the documentation, such as the official docs, docstrings, or even on the web in blog posts, articles, and such.

### Submit Feedback

The best way to send feedback is to file an issue at <https://github.com/UBC-MDS/chembox/issues>

If you are proposing a feature:

-   Explain in detail how it would work.
-   Keep the scope as narrow as possible, to make it easier to implement.
-   Remember that this is a volunteer-driven project, and that contributions are welcome :)

## Bigger changes

If you want to make a bigger change, it's a good idea to first file an issue and make sure someone from the team agrees that it's needed.
If you've found a bug, please file an issue that illustrates the bug with a minimal [reprex](https://www.tidyverse.org/help/#reprex) (this will also help you write a unit test, if needed).

## Get Started!

1.  Fork the chemboxr repo on GitHub.
2.  Clone your fork locally:

``` console
$ git clone git@github.com:your_name_here/chembox.git
```

3.  Open the folder in RStudio.

4.  Load `devtools` and install the package:

``` r
> library(devtools)
> install()
```

5.  Use `git` to create a branch for your local development and make your changes:

``` console
$ git switch -c name-of-your-bugfix-or-feature
```

6.  When you're done making changes, check that your changes conform to any code formatting requirements and pass any tests.

``` r
> check()
```

7.  Commit your changes and open a pull request.

``` console
$ git add .
$ git commit -m "Your detailed description of your changes."
$ git push origin name-of-your-bugfix-or-feature
```

### Code style

-   New code should follow the tidyverse [style guide](https://style.tidyverse.org).
    You can use the [styler](https://CRAN.R-project.org/package=styler) package to apply these styles, but please don't restyle code that has nothing to do with your PR.

-   We use [roxygen2](https://cran.r-project.org/package=roxygen2), with [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), for documentation.

-   We use [testthat](https://cran.r-project.org/package=testthat) for unit tests.
    Contributions with test cases included are easier to accept.

## Pull Request Guidelines

Before you submit a pull request, check that it meets these guidelines:

1. The pull request should include additional tests if appropriate.
2. If the pull request adds functionality, the docs should be updated, including adding a description of a new function in the README.md.
3. The pull request should work for all currently supported operating systems and versions of R. Check https://github.com/UBC-MDS/chemboxr/pulls and make sure that the tests pass for all supported R versions.

## Code of Conduct

Please note that the chemboxR project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By contributing to this project you agree to abide by its terms.
