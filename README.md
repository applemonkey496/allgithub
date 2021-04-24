# allgithub
Get commit dates and messages for all of your GitHub repos

## Dependencies
Other than standard POSIX utilities, this script depends on the `python3` and `curl` binaries. 

### Linux
These binaries should be easily available from your distro's package manager. 
For example, on Debian-based systems, you can install with `apt`:
```sh
sudo apt install python3 curl
```

### Mac
(Via [Homebrew](https://github.com/Homebrew/brew))
```sh
brew install python3 curl
```

## Command Usage
```sh
git clone https://github.com/applemonkey496/allgithub
cd allgithub

# Option 1: execute script
sudo chmod +x allgithub.sh
./allgithub.sh [USERNAME] [TOKEN]

# Option 2: run with bash
bash allgithub.sh [USERNAME] [TOKEN]

# See help.txt for more details.
```

## Testing
This has been tested on my Linux machine with bash 5.0.17 and Python 3.8.5. 
This will likely work on most POSIX systems, but I can't confirm that.

## Bugs
I created this script for the purpose I described in [this support thread](https://github.community/t/request-for-commit-history/170882/4), and so I didn't implement any fancy error handling because it was mainly for personal use. If you get any errors make sure that:
 1. You entered the command correctly. Check for spelling errors, etc.
 2. Ensure that the prerequisites are installed (you can check with the `which` command). 

If you're still having trouble, feel free to submit an issue.

## Contributing
Pull requests are totally welcome. Make sure you test the script before submitting the pull request to make sure everything works.
