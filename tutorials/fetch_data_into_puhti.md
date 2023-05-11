# Fetching data into Puhti

Puhti already has pre-existing language resources, but only for those users who are members of the `kieli` group. For the purposes of this course, we won't assume anything beyond just having a user account in the CSC project for this course. And fetching and processing data is something you'll be doing a lot anyway.

In this tutorial we will:

1. Log into Puhti's web-based file manager
2. Navigate to the course project's "scratch" directory for work-in-progress data
3. If necessary, create a new directory for ourselves
4. Open a terminal window in that directory
5. Type a command into the terminal to download a `.zip` file
6. Type a command into the terminal to unpack the `.zip`

Once you become comfortable with the terminal, you may find it more convenient to just do everything there. But for now we will do things with as little terminal use as possible.

## Log into the file manager

First, navigate to [puhti.csc.fi](https://www.puhti.csc.fi) in your web browser. Once there, click on the "Log in to Puhti" button and proceed with your authentication provider.

![Puhti web login](puhti_web_login.png)

Once logged in, you should see a row of "apps" like this:

![Puhti web apps](puhti_web_apps.png)

The "Home directory" app will launch a file manager that will open in your home directory, which is `/users/<username>`. That is a place just for you, put anything there you want, but up to a rather low limit of 10 GB. For working with data, we're going to go to `/scratch`, the place for large amounts of data that we're working on. Old data there is automatically cleaned from time to time, so don't leave important work lying around there forever.

## Navigate to `/scratch/project_<project-number>`

In the left-hand side, there should be a list of shortcuts, which allow quick access to the scratch directories of all your projects. We will go to the one for our course like this:

{% include videoEmbed.html filename="puhti_web_navigate_to_scratch.webm" %}

If for some reason you don't see the shortcut, you can also click on "Change directory" and type in the path you want.

{% include videoEmbed.html filename="puhti_web_navigate_to_scratch_2.webm" %}

## Create a directory

To keep people getting their files mixed up with each other, it's a good idea for each project member to keep their personal data in their own directory. If there isn't one already, create a folder with the same name as your login name here.

{% include videoEmbed.html filename="puhti_web_create_dir.webm" %}

## Open a terminal window

Now let's go into our own personal folder, and open a "terminal window". What's a terminal window? Don't worry, it's not the end. It's a place where we can type in commands for the computer to execute. The next few steps are best done that way.

The terminal window will open in a new tab in your browser. The file manager tab will remain usable, and you can switch back and forth between the tabs as needed. The terminal has a "working directory" just like the file manager, and when you start it from the file manager, they will have the same working directory.

{% include videoEmbed.html filename="puhti_web_open_terminal.webm" %}

(Don't worry about that warning.)

## Download a `.zip` file

We are going to use a program called `wget` to download our file. It's very simple: we simply need to type `wget`, a space character, and then the URL for our file. For this, navigate Kielipankki's corpus selection, settle on a dataset, find its location in the download service, and instead of downloading the file onto your own computer, right-click on the file name and choose "Copy link". Unfortunately, this only works with data that has a "PUB" license.

If you don't want to bother with these steps, you can use the URL `https://korp.csc.fi/download/eduskunta/v1.5/eduskunta-v1.5-vrt.zip`. Paste that after `wget` in the terminal, and you should get a result like this:

{% include videoEmbed.html filename="puhti_web_terminal_wget.webm" %}

## Unpack the `.zip` file

Now the directory should contain the `.zip` file. You can confirm this by going back to the file manager tab (you might need to reload the page with F5). Or you can write the command to list directory contents by typing `ls` in the terminal. Either way, time for the final step, unpacking the file. To do this, type `unzip <filename>` in the terminal. The terminal knows what files are visible, so you can use the TAB key on your keyboard to autocomplete the file name:

{% include videoEmbed.html filename="puhti_web_terminal_unzip.webm" %}

The unpacked data is about 2 GB, so it takes a while. Finally, you can type `exit` into the terminal. Then you can close the terminal tab, and in the file manager tab, you can go back to the main view by clicking on "Puhti" in the top left corner, or you can just close the tab.

Done! Congratulations! 
