# Remove Microsoft Remote Desktop from macOS

A macOS package to automatically uninstall the legacy
“Microsoft Remote Desktop” app once the new “Windows App” is installed.

## Motivation

Microsoft has replaced "Microsoft Remote Desktop" with a new "Window App":
https://techcommunity.microsoft.com/blog/windows-itpro-blog/windows-app-general-availability-coming-soon/4206647

The Windows App gets installed as part of an update of Microsoft Remote Desktop.
However, the obsolete Microsoft Remote Desktop is not deleted automatically -
users have to delete it manually.

This package retires Microsoft Remote Desktop.
It was build for Mac Administrators who want to speed up the migration to
Windows App or don't want to leave an outdated app that might become a security
problem.

## How it works

This package will only remove `/Applications/Microsoft Remote Desktop.app` from
the Mac if `/Applications/Windows App.app` is already present.
Otherwise the package installation will fail.

If Microsoft Remote Desktop was successfully removed or wasn't installed at all
the package will leave an install receipt
"de.bjoernalbers.remove-microsoft-remote-desktop".

## Usage

1. Download the [latest package](https://github.com/bjoernalbers/remove-microsoft-remote-desktop/releases/latest)
2. Deploy the package to your fleet, i.e. with [Munki](https://www.munki.org/munki/) or your MDM
