BREWFILE := $(HOME)/dotfiles/Brewfile

brewfile_install:
	@echo "Looking for Brewfile in the ~/dotfiles directory..."
ifneq ("$(wildcard $(BREWFILE))","")
	@echo "Installing packages from $(BREWFILE)..."
	brew bundle install --file=$(BREWFILE)
else
	@echo "No Brewfile found in the ~/dotfiles directory."
endif

brewfile_dump:
	@echo "Creating Brewfile in the ~/dotfiles directory..."
	brew bundle dump --force --file=$(BREWFILE)
	@echo "Brewfile created at $(BREWFILE)"
