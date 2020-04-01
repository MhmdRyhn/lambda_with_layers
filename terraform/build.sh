set -e

BASE_DIR="$(pwd)/.."
BUILD_DIR="$BASE_DIR/.build"

mkdir -p "$BUILD_DIR/dist/python"
pip3 install -r "$BASE_DIR/requirements.txt" -t "$BUILD_DIR/dist/python"
