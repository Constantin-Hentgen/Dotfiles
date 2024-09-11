# Linux Configuration and Tool Setup

This repository contains my personal Linux configuration files for tmux, nvim, i3, as well as scripts to automate the installation of these configurations and all my preferred tools and software on a fresh Fedora Linux system.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Tools and Software](#tools-and-software)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- A fresh installation of Fedora Linux with [i3wm](https://i3wm.org/).

https://fedoraproject.org/spins/i3/

(https://download.fedoraproject.org/pub/fedora/linux/releases/39/Spins/x86_64/iso/Fedora-i3-Live-x86_64-39-1.5.iso)


```bash
setxkbmap -layout fr -variant bepo_afnor
```

## Installation

To get started, follow these steps:

1. Clone this repository to your local machine:

```bash
cd ~
git clone https://github.com/Constantin-Hentgen/Dotfiles.git
cd Dotfiles
chmod +x run.sh
./run.sh
```

`/usr/share/X11/xorg.conf.d/40-libinput.conf`
