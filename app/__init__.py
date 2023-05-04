"""Initializes the flask application"""


import pathlib
import sys

# configure application and packages
import app.pipelines
import app.bigquery_downloader
import app.data_sets
import app.ui

# apply environment specific settings (not in git repo)
local_setup_py_path = pathlib.Path(__file__).parent.joinpath('local_setup.py')
if not local_setup_py_path.exists():
    from shutil import copy
    copy(f'{str(local_setup_py_path)}.example', str(local_setup_py_path))
    sys.stderr.write('!!! copied app/local_setup.py.example to app/local_setup.py. Please check it\n')

import app.local_setup
