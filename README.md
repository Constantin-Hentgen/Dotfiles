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

[https://fedoraproject.org/spins/i3/](https://fedoraproject.org/spins/i3/)

Set the keyboard layout to BÉPO AFNOR:

```bash
setxkbmap -layout fr -variant bepo_afnor
```

Install [ansible](https://www.ansible.com/):

```bash
dnf install ansible
```

## Installation

Clone this repository to your local machine:

```bash
cd ~
git clone https://github.com/Constantin-Hentgen/Dotfiles.git
cd Dotfiles
ansible-playbook ansible/playbook.yml --ask-become-pass -e "username=YOUR_USERNAME"
```

You can get your username by running the command `whoami`.
