RaaS
====

Loads Unix commands into an R environment
and enables to invoke them.


Installation
------------

```r
#install.packages("devtools")

devtools::install_github("kos59125/RaaS")
```

Examples
--------

```r
> library(RaaS)
> # Just type a unix command
> ls
Applications
Desktop
Documents
...
> # Command with parameters
> # The following command is same as "ls -l Desktop"
> ls[-l, Desktop]
drwx------+  4 user  group  0  1 1 00:00 .
drwxr-xr-x+  4 user  group  0  1 1 00:00 ..
...
```

Hint: if a parameter contains special characters (e.g. white-space),
the parameter should be quoted by backticks.

Limitations
-----------

* Some commands does not work well in R interactive environment


