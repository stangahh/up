#!/bin/bash

. $(pwd)/dependencies/brew.sh
. $(pwd)/dependencies/git.sh
. $(pwd)/dependencies/mac.sh
. $(pwd)/dependencies/iterm2.sh
. $(pwd)/dependencies/nodejs.sh
. $(pwd)/dependencies/zsh/autocomplete.sh
. $(pwd)/dependencies/zsh/syntax_highlight.sh
. $(pwd)/dependencies/xcode.sh
. $(pwd)/dependencies/zsh.sh

. $(pwd)/helpers/test_internet_connection.sh
. $(pwd)/helpers/setup_ssh_key.sh
. $(pwd)/helpers/step.sh

. $(pwd)/utils/spinner.sh

steps() {
    step "Check: Internet connection"
    test_internet_connection

    step "Setup: XCode CLI Tools"
    install_xcode_cli_tools

    step "Install: HomeBrew"
    install_home_brew

    step "Tap: Casks"
    install_brew_packages "tap" $(pwd)/packages/taps.txt

    step "Install: Brews"
    install_brew_packages "brew" $(pwd)/packages/brews.txt

    step "Install: Casks"
    install_brew_packages "cask" $(pwd)/packages/casks.txt

    step "Install: Nodejs"
    install_nodejs

    step "Install: Oh My Zsh"
    install_zsh

    step "Install: Zsh plugins"
    install_syntax_highlight
    install_autocomplete

    step "Config git"
    configure_git $(pwd)/config/.gitconfig $(pwd)/config/.gitignore_global

    step "Setup: SSH key"
    setup_ssh_key

    step "Config: Create Iterm2 configuration"
    create_iterm2_configuration $(pwd)/config/iterm.json

    step "Config: Fetch iterm2 color presets"
    fetch_iterm2_color_preset AdventureTime.itermcolors
    fetch_iterm2_color_preset DimmedMonokai.itermcolors
    fetch_iterm2_color_preset Wombat.itermcolors

    step "Config: Copy zshrc"
    copy_zsh_configuration $(pwd)/config/.zshrc

    step "Config: mac"
    configure_mac
}

main() {
    time steps
}
