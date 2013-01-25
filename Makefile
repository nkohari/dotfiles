BREW_PACKAGES = git hub figlet

install:
	install-brew install-brew-packages link-configs

install-brew:
	ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

install-brew-packages:
	for package in $(BREW_PACKAGES); do \
		brew install $$package; \
	done

link-configs:
	ln -snf ~/.dotfiles/bash/aliases ~/.bash_aliases
	ln -snf ~/.dotfiles/bash/profile ~/.bash_profile
	ln -snf ~/.dotfiles/git/config ~/.gitconfig
