> # Disclaimer
>
> This project is a Fork of [yuezk/GlobalProtect-openconnect 1.x branch](https://github.com/yuezk/GlobalProtect-openconnect/tree/1.x).
>
> # Changes from Upstream
>
> List of modifications:
> * Switch to Qt6

# GlobalProtect-openconnect

A GlobalProtect VPN client (GUI) for Linux based on Openconnect and built with Qt6, supports SAML auth mode, inspired by [gp-saml-gui](https://github.com/dlenski/gp-saml-gui).

<p align="center">
  <img src="https://user-images.githubusercontent.com/3297602/133869036-5c02b0d9-c2d9-4f87-8c81-e44f68cfd6ac.png">
</p>

## Features

- Similar user experience as the official client in macOS.
- Supports both SAML and non-SAML authentication modes.
- Supports automatically selecting the preferred gateway from the multiple gateways.
- Supports switching gateway from the system tray menu manually.

## Build & Install from source code

Clone this repo with:

```sh
git clone https://github.com/kakwa/GlobalProtect-openconnect.git
cd GlobalProtect-openconnect
```

### Ubuntu/Mint

Build and install with:

```sh
./scripts/install-ubuntu.sh
```

### Other Linux

Install the Qt6 dependencies and OpenConnect:

- QtCore
- QtWebEngine
- QtWebSockets
- QtDBus
- openconnect v8.x
- qtkeychain

...then build and install with:

```sh
./scripts/install.sh
```

## Run

Once the software is installed, you can run `gpclient` to start the UI.

## Passing the Custom Parameters to `OpenConnect` CLI

See [Configuration](https://github.com/yuezk/GlobalProtect-openconnect/wiki/Configuration)

## Display the system tray icon on Gnome 40

Install the [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/) extension and you will see the system try icon (Restart the system after the installation).

<p align="center">
  <img src="https://user-images.githubusercontent.com/3297602/130831022-b93492fd-46dd-4a8e-94a4-13b5747120b7.png" />
<p>


## Troubleshooting

Run `gpclient` in the Terminal and collect the logs.

## [License](./LICENSE)
GPLv3
