---
title: Storing Data After Processing
---

When the active data processing phase of the research project is completed, the life cycle of the used or produced data set can still continue. Ideally the next steps have been figured out well in advance as a part of initial [data management planning](https://research.csc.fi/data-management-planning), but if not, now is the time. Otherwise it is highly likely to end up pondering hard questions like "Where is the data I used for the research project?" or "Is this the final version of the data set?" when a need to revisit the data arises.

In the worst case, the data set can be lost already, e.g. left into a directory owned by a university user account that no longer exists due to changed affiliation. This is why for example the [scratch directory on Puhti](https://docs.csc.fi/computing/disk/#scratch-directory) is not a suitable place for storing the data: files older than 6 months are automatically removed. A slightly better case is that you and only you have the data (e.g. on a removable media) and you can in theory share it with others. The best case is that metadata for the data set can be viewed by others too, and they can either fetch the data set or request access easily.

This material focuses on aiding in the transition away from the worst case scenario and providing pointers for striving towards the best case scenario. As there are a number of options for depositing data, all of them cannot be covered in this material. There are also other crucial parts to data management, for example choosing what to keep at all. Those are not covered here either, as we concentrate on the technical matters. For more information, see e.g. [fairdata.fi](https://www.fairdata.fi/en/data-management-checklist/), [docs.csc.fi](https://docs.csc.fi/data/datasets/datamanagement/) and [research.csc.fi](https://research.csc.fi/data-management) offer more information. Your organization's data support can also likely aid you with questions regarding the data life cycle.

## Downloading Data from Puhti

The "trivial" solution saving moderate amounts of data from being wiped in periodical cleaning of Puhti scratch disk is to download and store it locally. Depending on the size of the data set and its expected future use, this can mean e.g. storing it on your own computer, burning it onto a DVD or copying it to an external hard disk.

Pros:

- Easy
- No need to apply for resources
- Does not require a valid project/account in the long term
- Negligible long term cost

Cons:

- Less suitable for huge data sets
- Sharing is troublesome
- Data loss can still easily happen (e.g. lost, damaged, corrupted or obsolete media)

The most beginner friendly way to download data is with the [Puhti web interface](https://puhti.csc.fi). In the web interface, you can navigate to the correct project and directory using the top left files menu, select the file(s) or directories to download, and initiate the download using the download button on the upper right. If you download a directory, it is automatically compressed into a zip file.

![Screenshot of Puhti web interface, showing a selected file from directory-contents table and a cursor hovering over the download-btn with text "Download" that triggers the download using browser](img/puhti_web_interface_download.png)

### Exercises

1. Navigate to Puhti web interface using your browser and download the file `exercises/storing_data/downloadable_secret.png` from the course project's scratch directory.

### Bonus: `scp` and `rsync`

If you have access to a unix shell (such as the terminal on Linux or MacOS) on the machine you want to copy the files to, you can also download files or directories from command line. Depending on the details of your system, the `scp` command might also work on Windows PowerShell. People with no command line experience (not familiar with basic commands such as `ls`, `cd` and `mv`) and people with no access to such command line can skip this section.

Doing operations using command line is less beginner friendly, but also more powerful for more complex needs such as filtering based on file name or doing operations in bulk. This method can also move data between computing environments without intermediate transfer to your own computer, making it suitable for large data sets too.

Basic usage is similar for both of the commands: `scp source target` or `rsync source target`. This copies the `source` file to `target`, where the source and target can be on different systems. For local files, providing path to the file is enough, whereas for remote files, identification for the machine is needed too. This can be an IP address (e.g. 86.50.164.182) or domain name (e.g. puhti.csc.fi) and is separated from the file path within the machine with a colon (`:`). Thus the commands for downloading the example file from the earlier screenshot to an pre-existing directory called `science` within the current directory would be

```
scp myusername@puhti.csc.fi:/scratch/project_2007849/examples/important_dataset.tar science/
```
or
```
rsync myusername@puhti.csc.fi:/scratch/project_2007849/examples/important_dataset.tar science/
```

The difference between the to commands is that `scp` does a "dumb" copy operation, always copying the files from the source to the destination, whereas `rsync` inspects modification times of existing files and skips pre-existing files that have not been modified. This makes it more suitable for e.g. backup purposes or resuming partially completed transfer operations.

There are also numerous additional command line options for `rsync` and some for `scp` too. For more details, you can check the commands' [man pages](https://en.wikipedia.org/wiki/Man_page) either via command line (`man scp` or `man rsync`) or using some of the [websites that show manpages](https://linux.die.net/man/1/) (note that these might not always be for exactly the same version of the command you are using).

If you want to try these comands out, you can try downloading the `downloadable_secret.png` file from the last exercise using either `scp` or `rsync`.

## Allas

A slightly more robust solution is to upload the data to [Allas](https://allas.csc.fi), the object storage service offered by CSC.

Pros:

- Someone else takes care of hosting the data
- Sharing the data with specific people is easy
- Opening the data for everyone is easy
- Can be operated via command line (e.g. on Puhti or a linux machine) or [web interface](https://allas.csc.fi)

Cons:

- Requires an active project
- Not long term (years, not tens of years)
- Limit for number of objects within a bucket

## Object Storage

Data in Allas is not stored as files in directories. Instead, Allas recognizes types of entities: _buckets_  and _objects_. Buckets are somewhat analogous to directories on your computer: they are containers within which the objects reside. Unlike normal directories, buckets cannot contain other buckets though. The actual data is stored within the buckets as objects.

For a casual user, the only visible difference is the lack of hierarchy within a bucket, and some tools even mask this by allowing treating slashes in object names as "pseudo-directories". Nonetheless, it is good to be aware of the terminology.

### Uploading Files from Local Machine

The web interface allows creating new buckets and uploading files to them either via the upload button or dragging and dropping.

![Screenshot of Allas web interface, showing a cursor hovering over a button with text "Upload" that triggers the file selection dialog that allows uploading using browser](img/allas_web_ui_upload.png)

### Uploading Files from Puhti

Files can be sent to Allas directly from the file system on Puhti. For this, you need to open a shell session to Puhti. As uploading data is not a heavy operation, this can be done in a login node, no need for proper computation jobs. Using the "Login node shell" button in [Puhti web interface](https://puhti.csc.fi) works, as does `ssh` command along the lines of `ssh yourusername@puhti.csc.fi` for people with access to unix-like terminal.

First we need to activate the [module](https://docs.csc.fi/computing/modules/) that provides functionality for interacting with Allas. You need to provide the password for your CSC account when prompted.
```
module load allas
allas-conf project_2007849
```

After that we use [a-commands](https://docs.csc.fi/data/Allas/using_allas/a_commands/) to interact with Allas. To upload a file or directory to Allas, we can use [`a-put`](https://docs.csc.fi/data/Allas/using_allas/a_commands/#a-put):

```
[jarvenp2@puhti-login15 ~]$ a-put /scratch/project_2007849/examples/completed_research
...
-------------------------------------------------------------------------------
5 files from /scratch/project_2007849/examples/completed_research uploaded to bucket 2007849-puhti-SCRATCH in Allas as one tar file:
2007849-puhti-SCRATCH/examples/completed_research.tar
-----------------------------------------------------------------

Upload summary:
              Date                      Name  Files Size(kB)              Location in 
 01.06.23 13:06:27 /scratch/project_2007849/examples/completed_research      5      416 2007849-puhti-SCRATCH/examples
-----------------------------------------------------------------
OK
```
Some of the lengthy output has been omitted above, but the interesting part is that everything in directory `/scratch/project_2007849/examples/completed_research` from Puhti has now been packaged to a single tar archive called `examples/completed_research.tar` uploaded to bucket called `2007849-puhti-SCRATCH`. The default bucket name is determined automatically based on the source of the data.

The tar archive location on Allas, `2007849-puhti-SCRATCH/examples/completed_research.tar`, looks like a path to a tar file within a directory `examples` that is contained within a directory called `2007849-puhti-SCRATCH`. As described earlier, Allas does not work this way though: instead `examples/completed_research.tar` is a single object that just happens to have a slash in its name.

#### Exercises

These exercises must be done on Puhti via a command line. Login node shell from [Puhti web interface](https://www.puhti.csc.fi) is fine.

1. Create a new file in your Puhti home directory (you can create an empty file with `touch`, e.g. `touch my_new_file.txt`) and upload it to Allas with `a-put`. Verify that the file can be seen in Allas by using the web interface. In which bucket is it?

1. Create a new file and upload it to bucket `upload_exercise_2` of the course project. Make sure that you don't use a file name that is likely to be used by another course participant (you can e.g. use your user name as part of the file name). See the [documentation](https://docs.csc.fi/data/Allas/using_allas/a_commands/#a-put) for instructions for uploading to a specific bucket.

### Listing Files

In addition to viewing the files in the web interface, you can use [`a-list`](https://docs.csc.fi/data/Allas/using_allas/a_commands/#a-list) from command line. Check the examples and apply the knowledge to the exercises below.

1. See which buckets exist for the course projects
1. See which files exist within the `upload_exercise_2` bucket

### Downloading Files

If you want to download files from Allas to your own computer, you can do that via the web interface. If you want to process them on Puhti or other remote machines, you should use [`a-get`](https://docs.csc.fi/data/Allas/using_allas/a_commands/#a-get).

Ny default, the command preserves the full directory path to the downloaded files. This means that downloading the previously updated `completed_research` dataset will recreate the full original directory hierarchy:

```
[jarvenp2@puhti-login15 ~]$ pwd
/users/jarvenp2
[jarvenp2@puhti-login15 ~]$ a-get 2007849-puhti-SCRATCH/examples/completed_research.tar
Starting to copy data from allas...
Downloading compressed object from Allas
Transferred:          400 KiB / 400 KiB, 100%, 0 B/s, ETA -
Transferred:            1 / 1, 100%
Elapsed time:         0.0s
Uncompressing downloaded object
scratch/project_2007849/examples/completed_research/
scratch/project_2007849/examples/completed_research/results/
scratch/project_2007849/examples/completed_research/results/next_week_lottery_numbers.txt
scratch/project_2007849/examples/completed_research/source_data/
scratch/project_2007849/examples/completed_research/source_data/february_barometric_pressure.csv
scratch/project_2007849/examples/completed_research/source_data/nuclear_energy_production.json
scratch/project_2007849/examples/completed_research/source_data/data_sources.txt
scratch/project_2007849/examples/completed_research/source_data/simulated_lottery_numbers.txt

Object:
  2007849-puhti-SCRATCH/examples/completed_research.tar 
copied and uncompressed from allas into:
  completed_research
```

Note that this did not overwrite the original data: as we ran the command in the home directory, it created directory `/users/jarvenp2/scratch` and placed the files inside, leaving the original `/scratch/project_2007849/` unchanged. The command also automatically extracted the tar archive: in Allas, there was just one object `examples/completed_research.tar` that was then uncompressed into the original file hierarchy by `a-get`.

The command also supports options that allow more control. Read [the documentation](https://docs.csc.fi/data/Allas/using_allas/a_commands/#a-list) and try them out yourself:

1. A directory `big_bunch_of_files` has been uploaded to bucket `download_exercise`. Only download the single interesting file in the directory, `interesting_file.txt`.
1. Download the full `big_bunch_of_files`, but specify that it should be downloaded into a new directory called `allas_download_practice`.

## Bonus: Fairdata Services

The [Fairdata services](https://www.fairdata.fi/en/) provide services for storing, sharing and publishing research data as well as discovering data sets created by others. They are a good option for data that can be of interest to other researchers too.

Pros:

- No running billing unit cost for storage space
- Sharing the data is easy
- Ready-made tooling for providing metadata together with the data
- Data is findable
- Accidental removal or alteration of data is not likely
- A stepping stone towards the National Digital Preservation Service

Cons:

- Requires an active project (but there are processes for transferring project managership)
- Not for data sets containing special categories of personal data

This course does not cover these services in detail, but the services [user guides](https://www.fairdata.fi/en/fairdata-quick-guide/) and [training](https://www.fairdata.fi/en/training/).



## Bonus: National Digital Preservation Service

[The National Digital Preservation Services](https://digitalpreservation.fi/en/node) guarantees that selected data sets remain usable for future generations despite file format and storage media obsolescence. In addition to the service's own website, [Fairdata FAQ](https://www.fairdata.fi/en/faq/#6) has some answers to common questions.

Pros:

- Very reliable

Cons:

- Not designed for sharing
- Costly and thus available only for selected data sets
- Limited file formats and strict submission processes