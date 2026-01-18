#!/bin/bash

VERSION=$(cat VERSION)

# Commit the changes
git commit -m "Release ${VERSION}" .
git tag v$VERSION -a -m "Release ${VERSION}"
