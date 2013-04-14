Raymond Tang's dotfiles
=======================

pianobar scrobbler event helper also needs something in the home directory. Provided here: [Here](https://gist.github.com/Raytray/5021019)  
My gitconfig has a few changes for colors, as well as aliases for more ease of use.  
xkbevd is for bell beeps. My systems do not contain an actual pcspkr, thus I use aplay and xkbevd to catch events and emit a short beep.  
bashrc is not listed as I use zshrc instead.  

## ZSH Aliases

#### Aliases for Default Flags
* ```ls --color=auto -CF```
    * Use colors, columns, and display indicators to filetype (Folder, executable, symlink, etc)
* ```weather --metric --alert```
    * Displays weather in metric and also display any alerts for given argument.
* ```youtube-dl```
    * Downloads youtube with title flag attached.
* ```emacs -nw```
    * Call emacs in no window mode.

#### cd -> cdls()
* Credit to [BinRoot](https://github.com/binroot)
* Immediately lists contents of the current directory after changing into a new directory

#### History and Process search.
* ```ps ax | grep```
* ```history | cut -c 8- | grep```

#### Launching Thunderbird Compose Window
* Takes any arguments as an attachment (Easier to specify files than to remember email addresses)
* TODO: Allow email addresses to be specified as parameters as well. (If argument is not found, and is validated as address, use as target address)

#### Calc
* Credit to [alrra](https://github.com/alrra)
* Basic calculator with additional improvements to formatting output of decimal numbers.
* Fahrenheit to Celsius and Celsius to Fahrenheit aliases based off of this.

#### Clipboard
* Quick alias to copy file or string into clipboard.

#### Google
* Quick alias to launch a google search on given string.

#### fliptable
* Relieve some stress by watching a small ascii animation flip tables.

#### alert
* Launches alrt.io with arguments to set a timer based on given parameters.

#### say
* Credit to [commandlinefu.com & marrowsuck](http://www.commandlinefu.com/commands/view/9629/google-text-to-speech-in-local-language-or-language-of-choice)
* Google text-to-speech in your local language or in language of choice via country code switch (ISO 639-1).
