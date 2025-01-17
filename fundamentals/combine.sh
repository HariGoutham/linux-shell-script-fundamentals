#!/bin/bash

# This script performs two main functions:
# 1. Converts a PDF file into a series of PNG images.
# 2. Extracts audio from an MP4 file and converts it to mono WAV format.
#
# Usage:
# To convert a PDF: ./script.sh pdf [FILE.PDF|/path/to/FILE.PDF]
# To extract audio: ./script.sh audio [FILE.MP4|/path/to/FILE.MP4]

# Check if the correct number of arguments is provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 {pdf|audio} [FILE]"
    exit 1
fi

# Determine the operation based on the first argument
OPERATION=$1
FILE=$2

case $OPERATION in
    pdf)
        # Convert a PDF into a series of PNG images
        echo "Converting PDF to PNG images..."

        # Pass in a PDF file.
        PDF="$FILE"

        # Replace ".pdf" with "-slides.png"
        SLIDES=${PDF/.pdf/-slides.png} 

        # Replace spaces with hyphens
        SLIDES=${SLIDES// /-} 

        # Convert to lower case
        SLIDES=${SLIDES,,}

        # Extract the basename from the path, if provided.
        SLIDES=$(basename "$SLIDES")

        # Convert the PDF into a series of images using ImageMagick's convert command.
        convert -density 300 "$PDF" -quality 100 "$SLIDES"
        echo "Conversion complete: $SLIDES"

        ;;
    audio)
        # Extract audio from an MP4 file and convert it to mono
        echo "Extracting audio from MP4 file..."

        INPUT_FILE="$FILE"
        BASE_DIR=$(dirname "$INPUT_FILE")  # Get the directory of the input file
        BASE_NAME=$(basename -s .mp4 "$INPUT_FILE")  # Get the base name without extension
        TMP_FILE=$(mktemp --suffix=.wav)  # Create a temporary WAV file
        OUT_FILE="$BASE_DIR/$BASE_NAME.wav"  # Define the output file path

        # Extract the audio using avconv
        avconv -y -i "$INPUT_FILE" "$TMP_FILE"

        # Take audio from one channel to create a mono WAV file using sox
        sox "$TMP_FILE" -c 1 "$OUT_FILE"

        # Display the name of the output file on the screen
        echo "Audio extracted to: $OUT_FILE"

        # Clean up the temporary file
        rm "$TMP_FILE"
        echo "Temporary file cleaned up."

        ;;
    *)
        echo "Invalid operation. Use 'pdf' or 'audio'."
        exit 1
        ;;
esac

exit 0  # Exit the script successfully