#!/bin/sh

# eliminates "You did not specify any refspecs to push"
git config --global push.default matching

# eliminates "You asked me to pull without telling me which branch"
git config --global branch.master.remote origin
git config --global branch.master.merge refs/heads/master
