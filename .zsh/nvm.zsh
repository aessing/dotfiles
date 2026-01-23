# NVM (Homebrew install)
export NVM_DIR="$HOME/.nvm"
if [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]]; then
	. "/opt/homebrew/opt/nvm/nvm.sh"                      # Load nvm
fi

if [[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]]; then
	. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"   # Load nvm completion
fi
