#!/bin/bash

. $(pwd)/helpers/print.sh

install_xcode_cli_tools() {
    if type xcode-select >&- && xpath=$(xcode-select --print-path) &&
        test -d "${xpath}" && test -x "${xpath}"; then
        print_success "Xcode CLI tools already installed."
    else
        xcode-select --install
        print_success "Xcode CLI tools installed!"
    fi
}
