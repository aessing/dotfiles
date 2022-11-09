# This loads nvm (DISABLED BECAUSE OF SLOW SHELL STARTUP)
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# This loads nvm bash_completion (DISABLED BECAUSE OF SLOW SHELL STARTUP)
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# NVM lazy load
if [ -s "$NVM_INSTALL_DIR/nvm.sh" ]; then
  [ -s "$NVM_INSTALL_DIR/etc/bash_completion.d/nvm" ] && . "$NVM_INSTALL_DIR/etc/bash_completion.d/nvm"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi