#!/bin/sh

set -e

# Download source

mkdir -p fonts

#https://fonts.google.com/noto/specimen/Noto+Serif+SC
##簡體

# Generate fonts

font_version=1.0

mkdir -p output

for input_file in fonts/*.ttf; do
    output_file=$(echo $input_file | sed -e 's#fonts/NotoSerifSC-\(.*\).ttf#output/HanSerif-\1.ttf#g')
    output_file_twp=$(echo $input_file | sed -e 's#fonts/NotoSerifSC-\(.*\).ttf#output/HanSerif-TW-\1.ttf#g')

    # no-twp (原始簡體)
    python3 -m OpenCCFontGenerator \
        -i $input_file \
        -o $output_file \
        -n config/name.json \
        --ttc-index=0 \
        --font-version=$font_version

    # twp (簡體轉繁體)
    python3 -m OpenCCFontGenerator \
        -i $input_file \
        -o $output_file_twp \
        -n config/name-twp.json \
        --ttc-index=0 \
        --font-version=$font_version \
        --twp
done