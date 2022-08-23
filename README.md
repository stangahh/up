<h1 align="center">UP</h1>

<p align="center">
  <a href="https://github.com/stangahh/up" target="_blank">
    <img alt="lambcycle" src="./assets/up.png" width="144">
  </a>
</p>

<p align="center">
UP is a declarative dotfile configuration.
Its main goal is to increase your productivity whilst keeping track of your dependencies.
Get UP and running in no time, start up your machine with one command!
</p>

- [Install](#install)
- [Mac Configuration](#mac-configuration)
- [Iterm Profile](#iterm-profile)
- [Color Presets](#color-presets)
- [Acknowledgements](#acknowledgements)
- [FAQ](#faq)

# Install

<p align="center">
  <a href="https://github.com/stangahh/up" target="_blank">
    <img alt="lambcycle" src="./assets/up_cli.png" width="500">
  </a>
</p>

Copy the following snippet into your current terminal.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/stangahh/up/master/install.sh)"
```

# Manual stuff

## Mac Configuration

Please read the [configurations](./dependencies/mac.sh) before applying them. Note that you can always reset them by typing:

```
defaults delete <domain>; # sets domain to default settings
killall <domain>; # restarts domain

e.g
defaults delete Dock;
killall Dock;
```

## Iterm

### Profile

UP uses a dynamic profile. see [here](https://www.iterm2.com/documentation-dynamic-profiles.html). To enable it, do:

```
Iterm2 >
    Preferences >
        Profiles > UP Config >
            Other Actions > Set as Default
```

<p align="center">
  <a href="https://github.com/stangahh/up" target="_blank">
    <img alt="lambcycle" src="./assets/up_iterm_config.gif" width="500">
  </a>
</p>

### Color Presets

Color presets can be downloaded by following [this url](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/README.md).
Alternatively you can follow the description below and import them from the color_presets folder.

```
Iterm2 > Preferences > Profiles > Colors > Color Presets > Import
```

# Acknowledgements

These configs and dotfiles stand on the shoulders of the following giants:

- https://github.com/minamarkham/formation
- https://github.com/mathiasbynens/dotfiles
- https://github.com/kevinSuttle/macOS-Defaults

# FAQ

- Have you tested these dotfiles?

  - Heck no, but I'll update here whenever I do actually run this bad boy.
