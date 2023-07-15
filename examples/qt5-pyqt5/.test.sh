#!/bin/sh
set -ex

echo ">> ${PYTHONPATH}"

python -c "import PyQt5.QtCore; print(PyQt5.QtCore.__file__)"
