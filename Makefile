BREW_PACKAGES=hub figlet fortune

install:
	install-brew install-brew-packages fix-key-bindings set-preferences create-symlinks

install-brew:
	ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

install-brew-packages:
	for package in $(BREW_PACKAGES); do \
		brew install $$package; \
	done

fix-key-bindings:
	mkdir ~/Library/KeyBindings
	cp ~/.dotfiles/scripts/DefaultKeyBinding.dict ~/Library/KeyBindings

set-preferences:
	defaults write com.apple.dashboard mcx-disabled -boolean YES
	killall Dock

create-symlinks:
	ln -snf ~/.dotfiles/bash/aliases ~/.bash_aliases
	ln -snf ~/.dotfiles/bash/profile ~/.bash_profile
	ln -snf ~/.dotfiles/git/config ~/.gitconfig
	ln -snf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
