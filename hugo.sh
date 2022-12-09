#!/bin/bash

get_latest_release() {
    curl --silent "https://api.github.com/repos/gohugoio/hugo/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/;s/v//g'
}

version=$(get_latest_release)

sha256sums() {
    curl -fsSL "https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_${version}_checksums.txt" | grep "hugo_extended_${version}_linux-amd64.deb" | cut -d " " -f 1
}

get_latest_release() {
    curl --silent "https://api.github.com/repos/gohugoio/hugo/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/;s/v//g'
}

version=$(get_latest_release)
ghurl="https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_extended_${version}_linux-amd64.deb"

curl -Lo tmp/hugo.deb ${ghurl}

curl -s -L ${ghurl} | tee tmp/hugo.deb | sha256sum -c <(echo "$(sha256sums)  -") || rm -f tmp/hugo.deb
