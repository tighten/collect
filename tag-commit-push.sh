#!/bin/bash

function validateVersion()
{
    echo ""
    passedVersion=$1
    echo "Validating tag $passedVersion..."

    # Todo: validate the version here using a regex; if fail, just exit
    #       ... expect 8.75.0, with no v in front of it

    if [[ $passedVersion == '' ]]; then
        echo "Invalid tag. Tags should be structured without v: 8.57.0"
        exit
    fi

    echo "Tag valid."
    echo ""
}

# Exit script if any command fails (e.g. phpunit)
set -e

# Get the version and exit if not valid
validateVersion $1

# Create official v prefaced version
version="v$1"

# Run tests (and bail if they fail)
phpunit
echo ""
echo "Tests succeeded."

# Add and commit, with "8.57.0 changes" as the commit name
git add -A
git commit -m "$version changes"

echo ""
echo "Git committed."

# Tag v8.57.0
git tag -a $version -m "$version changes"
echo ""
echo "Created Git tag"

# Push
git push

# Push tag
git push origin $version
