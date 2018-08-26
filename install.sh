function create-link {
	local -r SRC=$1
	local -r DEST=$2

	mkdir -p "$(dirname "$DEST")"
	if ! [ -L "$DEST" ]; then
		ln -ivs "$SRC" "$DEST"
	else
		echo "Skipping, link already exists: $DEST"
	fi
}

function link-files {
	echo "Linking files..."
	create-link "$PWD/vimrc" "$HOME/.vimrc"
	create-link "$PWD/zshrc" "$HOME/.zshrc"
    create-link "$PWD/vim/colors" "$HOME/.vim/colors"
    create-link "$PWD/vim/autoload" "$HOME/.vim/autoload"
}

function install-powerline-fonts {
    echo "Installing powerline fonts.."
    git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline/fonts.git
    bash /tmp/powerline/fonts.git/install.sh
    rm -rf /tmp/powerline/fonts.git || true
}

function install-vim-plugins {
	echo "Installing Vundle..."
	local -r installDir="$HOME/.vim/bundle/Vundle.vim"
	rm -rf "$installDir" || true
	git clone https://github.com/VundleVim/Vundle.vim.git "$installDir"

	echo "Installing Vim plugins..."
	vim +PluginInstall +qall
}

function install-all {
	link-files
	install-vim-plugins
    install-powerline-fonts
}

install-all

