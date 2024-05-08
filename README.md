# barf-backup

A script that I use to backup my [barf](https://git.btxx.org/barf/)-based blog to a git repo. You will have to initialized the directory to be backed up as a Git repo with a remote before using. 

You can configure the script by creating a `.env` file with the following variables (All paths must be absolute and must be in quotes):

* `TARGET_DIR` - The directory to be backed up.
* `LOG_FILE` - A path at which to store the log file of the script.
* `GIT_LOG_FILE` - A path at which to store the Git log file of the script.
* `SUCCESS_MSG` - The message to display in the log upon a successful backup. I usually use `"Backup complete"`
* `ERROR_MSG` - An error message to display upon backup failure. I usually use `"Error adding changes to git"`
* `LOG_DATE` - How you want your log date formatted. I usually use `"$(date +'%Y-%m-%d')"`
