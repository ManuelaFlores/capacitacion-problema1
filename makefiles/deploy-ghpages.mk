.PHONY: deploy.ghpages

DEPLOY_DIR = deploy
BUILD_DIR = build
GIT_BRANCH = gh-pages
GIT_PERSONAL_TOKEN = --TOKEN---
GIT_BRANCH_DIR = $(PWD)/$(DEPLOY_DIR)/$(GIT_BRANCH)

define mkdir_deploy_dir
    @if [ ! -d "$(GIT_BRANCH_DIR)" ]; then mkdir $(GIT_BRANCH_DIR); fi
endef

define git_init
    @cd $(GIT_BRANCH_DIR) && \
     rm -rf $(GIT_BRANCH_DIR)/.git && \
     git init
endef