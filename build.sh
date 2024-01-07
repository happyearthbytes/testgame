#!/usr/bin/env bash
# no zip hack
source_dir=build
zipname=fort-web.zip
outfile=${source_dir}/${zipname}
# delete the zip if it exists
rm $outfile

# zip hack
pushd "$source_dir"
git init
git add .
git commit -m "commit for zip"
popd
git archive --format=zip -o "$outfile" --remote="$source_dir" HEAD

# Remove the zipped files
pushd "$source_dir"
rm $(ls -I $zipname )
popd
