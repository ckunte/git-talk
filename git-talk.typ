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
  #set raw(syntaxes: "/inc/Bash.sublime-syntax")
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

  August 2024
]

#slide[
  #side-by-side[

  #rect(
    image("/inc/final.png") // courtesy: PhD comics
  )

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

    - traceability (granular level)
    - better diffs
    - branch out #sym.arrow.r work on parts #sym.arrow.r merge back
    - reuse, collaboration
    - retaining history
    - disciplined work
    - habit worth cultivating
  
  ][
  = types

  / CVCS: centralised
  / DVCS: distributed

  = software

  / 1986: CVS
  / 1992: TeamWare
  / 2000: Subversion, BitKeeper
  / 2003: Monotone
  / 2005: git, Mercurial

  ]
]

#focus-slide[
  
  = git

]

#slide[
  #side-by-side[
    = background

    / 1991: Linus begins a hobby project called linux

    / 2005: Linus creates git to manage linux including kernel code contributions from others

    / 2008: GitHub is born, makes git very popular; 94% market share by 2022

    // reference links: 
    //  https://youtu.be/0m4hlWx7oRk
    //  https://blog.brachiosoft.com/en/posts/git/
  
  ][
    = git
    
    - DVCS
    - a bunch of CLI programs
    - great software; bad UI/UX
    - GUI clients #sym.arrow.r sanity
    - originally designed for linux FS; now available for all OSes
    - for plain text files 
    - not for tracking binary files

  ]
]

#focus-slide[

  = version control _with_ git

]

#slide[
  #side-by-side[
    #figure(
      image("/inc/git-xkcd.png"), // courtesy: https://xkcd.com/1597/
    )
  ][
    = how to?

    - initialise a working folder
    - check status
    - add files
    - commit added files

    = basic commands

    ```bash
    git init
    git status
    git add
    git commit
    ```
  ]
]

#slide[

= init, add, commit

  ```bash
  $ git init
  Initialized empty Git repository in ~/model/.git/

  $ git add README.md

  $ git commit -m "Add README file"
  [master (root-commit) 74218c0] Add README file
   1 file changed, 1 insertion(+)
   create mode 100644 README.md 
  ``` 
]

#focus-slide[
  = what just happened?
]

#slide[
  == `git init`
  - creates a subfolder `.git` within the working folder
  - `.git` folder collects filesystem snapshots of the working folder

  == `git add`
  - for tracking files of interest, they first need to be added

  == `git commit`
  - a command for taking a filesystem snapshot (of added files)
  - uses secure hash algorithm (SHA) #sym.arrow.r for data integrity
  - commits never change; their IDs are computed from their contents

]
#focus-slide[

  = ignore _certain_ files

]


#slide[
  = `.gitignore`

  - git has a provision for ignoring files of disinterest
  - `.gitignore` file in the repository does the job, e.g.

  ```bash
  *.pdf
  *.xlsx
  ```
  Inverting ignore:

  ```bash
  *
  !*.inp
  ```

  - `*` to ignore all
  - `!` applies an exception to include only files with `.inp` extension
]

#focus-slide[
  
 = git config

]

#slide[

  = `.gitconfig`

  - Handy if commits are pushed to a remote server
  - Commits signed with digital keys to prevent author spoofing
  - Either GPG or SSH keys can be used for signing commits
  - Keys are private; never share
  - Public key cryptography for signing commits commonly used
  - The example uses elliptic cryptography (EdDSA + curve 25519)


  ```bash
[user]
  name = Chetan Kunte
  email = 177423+ckunte@users.noreply.github.com
  signingkey = ~/.ssh/id_ed25519.pub
[commit]
  gpgsign = true
[tag]
  gpgsign = true
[gpg]
  format = ssh
[gpg "ssh"]
  allowedSignersFile = ~/.ssh/allowed_signers
[init]
  defaultBranch = master
[core]
  autocrlf = input
  ```
]

#slide[
  #figure(
    image("/inc/smerge.png", width: 74%),
  ) <sm>
    
]

#focus-slide[
  = demo
]

#focus-slide[
  = thank you; questions?
]
