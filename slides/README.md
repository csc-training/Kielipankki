# Creating Slides

# Rapid Slide Development Magic
You need [slidefactory](https://github.com/csc-training/slidefactory) and [inotify-tools](https://github.com/inotify-tools/inotify-tools) (likely available via your package manager). Then you can recompile the slides every time the markdown file changes by running
```
$ while true; do inotifywait -e modify file.md; slidefactory.sif file.md; done
```
in one terminal and
```
$ python3 -m http.server 8000
```
in another. Now you can view the slides in your browser.
