// preamble 
  #import "@preview/polylux:0.3.1": *
  #import themes.simple: *
  #set page(paper: "presentation-16-9")
  #show: simple-theme.with(
    footer: [version control for engineers],
  )
  #set text(
    font: "erewhon",
    top-edge: "cap-height",
    bottom-edge: "baseline",
    number-type: "old-style",
    size:24pt
  ) // main font used
  #show raw: set text(font: "PT Mono", size: 21pt) // font for code
  #set raw(syntaxes: "/inc/Bash.sublime-syntax") // for highlighting
  #show link: set text(fill: rgb(0, 0, 255)) // show links w/ colour
  #let sc(content) = text(features: ("c2sc",))[#content]
  #show regex("[A-Z]{2,}"): match => {
    sc(match)
  }

//
#title-slide[

  = version control for engineers

  _The art of tracking (atomic) changes with git_

  #image("/inc/kplc.png")

  _lunch & learn_

  C Kunte, August 2024

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

#centered-slide[
  //  - Atomic changes, meaningful comments re. change
  = version control

]

#slide[
  #side-by-side[
  = why

    - recording change _explicitly_
    - _atomic_ level traceability
    - retaining full history
    - better diffs
    - branch out #sym.arrow.r work on parts #sym.arrow.r merge back
    - reuse, collaboration
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

#centered-slide[
  
  = git
]

#slide[
  #side-by-side[
    = background

    / 1991: Linus begins a hobby project called *linux*

    / 2005: Linus creates *git* to manage linux including kernel code contributions from others

    / 2008: GitHub is born, makes git very popular; #highlight[94% market share] by 2022

    // reference links: 
    //  https://youtu.be/0m4hlWx7oRk
    //  https://blog.brachiosoft.com/en/posts/git/
  
  ][
    = git
    
    - DVCS, portable
    - a bunch of CLI programs
    - great software; bad UI/UX
    - open source, free
    - GUI clients == sanity
    - originally designed for linux FS; now available for all OSes
    - #highlight[for plain text] files 
    - not for tracking binary files

  ]
]

#centered-slide[

  = how to 

  version control _with_ git

]

#slide[
  #side-by-side[
    #figure(
      image("/inc/git-xkcd.png"), // courtesy: https://xkcd.com/1597/
    )
  ][

  = how to

    + initialise a working folder
    + check status
    + add (i.e. stage) files
    + commit added files

    = basic commands
    ```bash
    git init    # initialise
    git status  # check status
    git add     # stage file(s)
    git commit  # commit changes
    git log     # list commits
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

#centered-slide[

  = what just happened?
]

#slide[

  == git init
  - creates a subfolder named `.git` within the working folder
  - `.git` folder collects filesystem snapshots of the working folder

  == git add
  - for tracking files of interest, they first need to be added

  == git commit
  - a command for taking a filesystem snapshot (of added files)
  - uses secure hash algorithm (SHA) #sym.arrow.r for data integrity
  - commits never change; IDs are computed from their contents
  - Designed initially with SHA1; now using SHA256 to avoid collision

]

#centered-slide[

  = commit -- a 2-stage process
  + *add* files (new, changed)
  + *commit* (new, changed)

  i.e., recording change _explicitly_

]

#centered-slide[

  = git status

]

#slide[

  #figure(
    image("/inc/status.png", width: auto),
  ) <status>

]

#slide[

  #figure(
    image("/inc/smerge0.png", height: auto),
  ) <sm0>
  
]


#centered-slide[

  = git log

]

#slide[

  #figure(
    image("/inc/gitlog.png", height: auto),
  ) <gitlog>
    
]

#slide[

  #figure(
    image("/inc/smerge.png", height: auto),
  ) <sm1>
  
]

#centered-slide[
  = demo. #footnote[Switch to _Terminal_ / _Sublime Merge_]

]

#centered-slide[

  = ignore _certain_ files

]


#slide[
  = .gitignore

  - git has a provision for ignoring files of disinterest
  - .gitignore file in the repository does the job, e.g.

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

#centered-slide[
  
 = git config

]

#slide[

  = .gitconfig

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

#centered-slide[

  = version control

  _best practices_

]
#slide[
  
  - make small, incremental changes

  - keep commits atomic
    - test before committing
    - get feedback through (e.g. peer) reviews
    - avoid committing incomplete work (units) and unnecessary files
    - commit often
    - write clear and concise commit messages

  - develop using branches (treat 'master' or 'main' branch sacred)

  - agree on a workflow / branching strategy

  - keep the repository clean and up to-date

]

#centered-slide[

  = MORGAN #footnote[Kent plc's model management system]

  _with git_

]
#slide[

  = git is _complementary_ to MORGAN

  - MORGAN project as a global repository
    - git repo as a history of traceable atomic changes _within_ it
    - history resides within the subfolder `.git`

  - with git, MORGAN will:
    - not require an external diff system; git is _fast_ (18y of engineering)
    - not require the need to work with multiple version folders
    - be simpler + accurate in tracking changes
    - be compact; entire history of change is available
    - be easiest to revert to earlier states/ver. with 1-click/command

]

#centered-slide[

  #quote(block:true, attribution: [Kevin Kelly])[
    _*Buying tools?* Start with the cheapest you can find. Upgrade the ones that you use a lot. If you wind-up using for work, then buy the very best you can afford._
  ]

]

#slide[
  
  = GUI clients for git

  + Sublime Merge (a personal favourite)
    - by Sublime HQ (makers of Sublime Text), Australian
    - pretty good software
    - never have to see command line, if you so wish
    - feature complete, very easy to use, clean interface
    - commercial: 
      - personal license: \$99/3y (allowed at work)
      - commercial license: \$75/y
      - trial period unlimited; all features available, no catch, be fair

  + try others: #link("https://git-scm.com/downloads/guis")[git-scm.com/downloads/guis]
]

#slide[
  
  = [re] learn to use command line interface

  - a query-response system (e.g. ChatGPT is a CLI of sorts)
  - learn from the best: MIT course "The missing semester"
  - Windows ships with linux (_aka_ Windows Subsystem for linux)
  - alternatively, get a cheap SBC (e.g. Raspberry Pi) to try linux
  - practice doing things in command line, it is
    - powerful
    - versatile
    - very low on resource demand

]

#slide[
  
  = recap

  + git -- today's _state of the art_ in version control, portable, distributed
  + a _two-stage_ process, i.e., add, commit
  + every commit is a _snapshot_ of working folder's filesystem
  + git computes diffs between commits on the fly, very fast
  + git is like a machine for time-travel through file (or model) history
  + works best with _plain text_ files, not useful for binary files (no diffs)
  + all history resides within .git subfolder under the working folder

]

#slide[
  = resources

  - `git help everyday` -- most helpful beginner's command
  - git source code management (#link("https://git-scm.com")[git-scm.com])
  - git GUI software (#link("https://git-scm.com/downloads")[git-scm.com/downloads])
  - git guides (#link("https://github.com/git-guides")[github.com/git-guides])
  - getting git right (#link("https://www.atlassian.com/git")[atlassian.com/git])
  - github docs (#link("https://docs.github.com/en")[docs.github.com/en])
  - a git history (#link("https://blog.brachiosoft.com/en/posts/git/")[blog.brachiosoft.com/en/posts/git/])
  - "how git works" illustrated by J Evans (#link("https://wizardzines.com/zines/git")[wizardzines.com/zines/git])
  - Linus's talk about git c. 2007 (#link("https://youtu.be/MjIPv8a0hU8")[youtu.be/MjIPv8a0hU8])

]

#centered-slide[

  = thank you; questions?

]
