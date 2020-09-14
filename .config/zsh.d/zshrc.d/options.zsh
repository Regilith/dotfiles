# completion
setopt CORRECT
setopt NO_NOMATCH
setopt LIST_PACKED
setopt ALWAYS_TO_END
setopt GLOB_COMPLETE
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD

# If a command is issued that can't be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt autocd

# With this option set, stopped jobs that are removed from the job table with the disown builtin command are automatically sent a CONT signal to make them running.
setopt autocontinue

# List jobs in the long format by default.
setopt longlistjobs

# extended globbing, awesome!
setopt extendedGlob

#setopt TRANSIENT_RPROMPT

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Ignore lines prefixed with '#'.
setopt interactivecomments

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol