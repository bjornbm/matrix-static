#!/usr/bin/env sh

set -e

dir=$(mktemp -d dist-docs.XXXXXX)
#trap 'rm -r "$dir"' EXIT

cabal new-haddock --builddir="$dir" --haddock-for-hackage --haddock-hyperlink-source
# Starting with cabal 2.0, `--publish` is needed for uploading to non-candidate releases
cabal upload --publish -d $dir/*-docs.tar.gz

