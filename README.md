# Kielipankki
Training material for The Language Bank's courses

## Requirements

You need [slidefactory](https://github.com/csc-training/slidefactory) (git
installation is best for ensuring that the locally compiled results are
identical to the ones produced by the pipeline) to create the slides. Depending
on your OS, the steps required for installing the requirements are likely
something along the lines of
```
apt install python3-pip pandoc python3-pandocfilters fonts-noto fonts-inconsolata cabal-install
cabal update
cabal install pandoc-types-1.17.5.4 pandoc-emphasize-code
```

After the actual installation, you also need to add the path to `convert.py` to
your PATH, preferably in .bashrc so you don't need to reset it on every login.

Slidefactory includes the theme for slides, but the tutorial/handout pages need a pandoc theme of their own. The publishing pipeline uses [GitHub template from pandoc-goodies](https://github.com/tajmone/pandoc-goodies/tree/master/templates/html5/github) so you should download it and place it in the default pandoc template directory
```
mkdir -p ~/.pandoc/templates
wget https://raw.githubusercontent.com/tajmone/pandoc-goodies/master/templates/html5/github/GitHub.html5 -O ~/.pandoc/templates/GitHub.html5
```

## Converting Files Locally

To ensure that the relative links to images etc work, you need to navigate to
the directory containing the source file first.

Creating self-contained documents is a bit slower than normal conversion, so if
you want to get rapid feedback, you can drop `--self-contained`.

### Slides
HTML versions of the slides can be generated with
```
convert.py --self-contained file.md
```

In theory the conversion script should also be able to generate pdf files, but
depending on your Python version this can also fail. The full command for PDF
creation is
```
convert.py --self-contained --pdf --verbose file.md
```
If it executes successfully, it should provide a pdf version of the given
slides. Even if execution fails, it will output the actual pdf generation
command that can be run manually. The command will be something along the lines
of
```
chromium-browser \
  --headless \
  --virtual-time-budget=10000 \
  --run-all-compositor-stages-before-draw \
  --print-to-pdf=file.pdf \
  file:///path/to/your/html/file.html?print-pdf
```

Tip: even if convert.py PDF creation doesn't work out of the box, you can fix
the wrong Python version problem by editing the file manually:
1. Check where the script is by running `which convert.py`
1. Edit the shebang so that instead of `#!/usr/bin/python` it says
   `#!/usr/bin/python3` (or whatever is the path to your Python 3 installation)


### Handouts/Tutorials
```
pandoc --template=GitHub.html5 --self-contained file.md -o file.html
```


## Rapid Development Magic

In addition to slidefactory, you need to have
[inotify-tools](https://github.com/inotify-tools/inotify-tools) installed
(likely available via your package manager). Then you can recompile the slides
every time the markdown file changes by running
```
$ while true; do inotifywait -e modify file.md; [conversion command]; done
```
in one terminal and
```
$ python3 -m http.server 8000
```
in another. Now you can view the slides in your browser.
