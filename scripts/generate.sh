#!/usr/bin/env bash

fvm flutter gen-l10n
fvm flutter pub run build_runner build
