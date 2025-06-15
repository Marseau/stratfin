export PATH=$PATH:/usr/lib/jvm/java-17-openjdk/bin



eval "$(rbenv init -)" # For Zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marseau/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marseau/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marseau/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marseau/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/node@20/bin:$PATH"
