#!/usr/bin/env bash
set -o errexit
set -o pipefail

echo -e "---\ntype: quote\nstate: queue\n---" | vipe | tumblr --host=50shadesoflambda.tumblr.com
