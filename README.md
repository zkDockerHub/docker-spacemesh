# [Spacemesh: A Programmable Cryptocurrency](https://spacemesh.io)

[![license](https://img.shields.io/packagist/l/doctrine/orm.svg)](https://github.com/spacemeshos/go-spacemesh/blob/master/LICENSE)
[![release](https://img.shields.io/github/v/release/spacemeshos/go-spacemesh?include_prereleases)](https://github.com/spacemeshos/go-spacemesh/releases)
![platform](https://img.shields.io/badge/platform-win--64%20|%20macos--64%20|%20linux--64%20|%20freebsd-lightgrey.svg)
[![go version](https://img.shields.io/github/go-mod/go-version/spacemeshos/go-spacemesh?logo=go)](https://go.dev/)
[![open help wanted issues](https://img.shields.io/github/issues-raw/spacemeshos/go-spacemesh/help%20wanted?logo=github)](https://github.com/spacemeshos/go-spacemesh/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)
[![discord](https://img.shields.io/discord/623195163510046732?label=discord&logo=discord)](http://chat.spacemesh.io/)
[![made by](https://img.shields.io/badge/madeby-spacemeshos-blue.svg)](https://spacemesh.io)
[![Go Report Card](https://goreportcard.com/badge/github.com/spacemeshos/go-spacemesh)](https://goreportcard.com/report/github.com/spacemeshos/go-spacemesh)
[![Bors enabled](https://bors.tech/images/badge_small.svg)](https://app.bors.tech/repositories/22421)
[![godoc](https://img.shields.io/badge/godoc-LGTM-blue.svg)](https://godoc.org/github.com/spacemeshos/go-spacemesh)
[![CI: passing](https://img.shields.io/badge/CI-passing-success?logo=github&style=flat)](https://github.com/spacemeshos/go-spacemesh/blob/develop/ci.md#ci-status)

## docker-spacemesh

💾⏰💪

This project is a Docker image that using the original project [go-spacemesh](https://github.com/spacemeshos/go-spacemesh) build.

### Building

To build `docker-spacemesh` for your current system architecture, from the project root directory, use:

```bash
docker build . -t go-spacemesh:latest --no-cache
```

### Running

```bash
docker compose up -d
```