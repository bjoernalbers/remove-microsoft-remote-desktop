# Retire Microsoft Remote Desktop

A macOS Package to remove the obsolete "Microsoft Remote Desktop.app" if its
successor "Windows App.app" has already been installed.

## Motivation

Microsoft has renamed "Microsoft Remote Desktop.app" to "Window App.app":
https://techcommunity.microsoft.com/blog/windows-itpro-blog/windows-app-general-availability-coming-soon/4206647
But it forgot to actually delete "Microsoft Remote Desktop.app" during the update,
so that users might still use the outdated app.
This package uninstalls it in order to fix this security issue.

## Usage

1. Run `make`
2. Install the package to retire the app
