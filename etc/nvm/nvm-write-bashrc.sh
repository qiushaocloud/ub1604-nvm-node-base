#!/bin/bash
if cat .bashrc | grep 'export NVM_DIR="$HOME/.nvm"'>/dev/null
then
        echo "exist nvm"
else
        echo "not exist nvm"
	echo "" >> .bashrc
	echo 'export NVM_DIR="$HOME/.nvm"'  >> .bashrc
	echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'  >> .bashrc
	echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'  >> .bashrc
	echo "" >> .bashrc
fi
