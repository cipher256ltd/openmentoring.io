#!/bin/bash
#set -eu #fail on exit codes and unset variables

CONTENT=content
TMP=_tmp
SITE=_site

# ensure empty _tmp and _site directories
# for dir in $TMP $SITE; do
#     if [[ ! -d "$dir" ]]; then
#         mkdir "$dir"
#     else
#         (cd "$dir" && rm -rf ./*)
#     fi
# done
#

# # ensure ../project
# if [[ ! -d "../project" ]]; then
#     mkdir ../project
# fi
#
# # clone subrepos
# for repo in architecture design framework schema; do
#     if [[ ! -d "../project/$repo" ]]; then
#         (cd "../project" && git clone https://code.iilab.org/openintegrity/$repo.git)
#     fi
# done

# # copy code directory
# rsync --archive \
#       --exclude "code/scss" \
#       code _tmp/

# # build Sass
# ./node_modules/.bin/node-sass code/scss/skeleton.scss > _tmp/code/public/css/skeleton.css

# # copy non-markdown content
# rsync --copy-links \
#       --archive \
#       --exclude "$CONTENT/design/mockup" \
#       --exclude "*.md" \
#       $CONTENT/ $TMP/
#
# # transclude markdown content
# (cd $CONTENT && find -L . \
#     -type f \
#     -name "*.md" \
#     -print0 ) \
#     | xargs -P 8 --null -I {} hercule $CONTENT/{} -o $TMP/{}

# run metalsmith
grunt build

# copy prebuilt content
# rsync --copy-links \
#       --archive \
#       --exclude "$CONTENT/design/mockup/node_modules" \
#       $CONTENT/design/mockup $SITE/openintegrity.org/design
