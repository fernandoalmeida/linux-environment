#!/bin/bash -e

repo=https://packages.gitlab.com/install/repositories/runner
installer=$repo/gitlab-ci-multi-runner/script.deb.sh

curl -sSL $installer | sudo bash

cat <<EOF | sudo tee /etc/apt/preferences.d/pin-gitlab-runner.pref
Explanation: Prefer GitLab provided packages over the Debian native ones
Package: gitlab-ci-multi-runner
Pin: origin packages.gitlab.com
Pin-Priority: 1001
EOF

sudo apt-get install -qqy gitlab-ci-multi-runner
