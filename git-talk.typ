// preamble 

  #import "@preview/polylux:0.3.1": *
  #import themes.simple: *
  #set text(
    font: "Publico Text",
    top-edge: "cap-height",
    bottom-edge: "baseline",
    number-type: "old-style",
  )
  #show raw: set text(font: "PT Mono", size: 24pt)
  #show link: set text(fill: rgb(0, 0, 255))
  #set page(paper: "presentation-16-9")
  #set text(size: 36pt)
  #let sc(content) = text(features: ("c2sc",))[#content]
  #show regex("[A-Z]{2,}"): match => {
    sc(match)
  }
  #show: simple-theme.with(
    footer: [version control for engineers],
  )

#title-slide[

  = version control for engineers

  The art of tracking (atomic) changes with git

  #v(0.5em)

  C Kunte #footnote[Principal engineer, Kent plc]

  19 July 2024
]

#slide[
  #side-by-side[

  #rect(image("/inc/final.png"))

  ][

  = agenda

  - version control
  - git
  - how to

  ]
]

#focus-slide[
  //  - Atomic changes, meaningful comments re. change
  = version control

]

#slide[
  #side-by-side[
  = why?

    - traceability
    - better diffs
    - branch, work on parts, merge back
    - reuse, collaboration
    - retaining history
    - disciplined work
    - habit worth cultivating
  
  ][
  = types

  / CVCS: centralised
  / DVCS: distributed

  = software

  - 1986: CVS
  - 1992: TeamWare
  - 2000: Subversion, BitKeeper
  - 2003: Monotone
  - 2005: git, Mercurial

  ]
]

#focus-slide[
  
  = git

]

#slide[
  #side-by-side[
    = git
    
    - a DVCS
    - a suite of terminal programs
    - great software; bad UI/UX
    - GUI interface(s) available
    - best with plain text files
    - not for tracking binary files

  ][
    = background

    / 1991: Linus begins a project called linux
    / 2005: He creates git #footnote[Not without drama, see #link("https://blog.brachiosoft.com/en/posts/git/")[_"A git story: not so fun this time"_]] to best manage code contributions to linux
    / 2022: git at 94% market share
  ]
]

#focus-slide[

  = version control with git

]

#slide[
  #side-by-side[
    #figure(
      image("/inc/git-xkcd.png"),
      // courtesy: Randall Monroe, https://xkcd.com/1597/
    )
  ][
    = how to?

    - initialise a working folder
    - add files
    - commit added files
    - push (if server is used)

    = basic commands

    ```
    git init
    git add <filenames>
    git commit -m "comments"
    git push
    ```
  ]
]

#slide[

= init, add, commit

  ```shell
  $ git init
  Initialized empty Git repository in ~/model/.git/

  $ git add README.md

  $ git commit -m "Add README file"
  [master (root-commit) 74218c0] Add README file
   1 file changed, 1 insertion(+)
   create mode 100644 README.md 
  ``` 
]