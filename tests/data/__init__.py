#   Copyright 2018 Adam Cowdy
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

import os
import rdflib

DATA_DIR = os.path.dirname(__file__)


def _data_file(file):
    return os.path.join(DATA_DIR, file)


def bundle(name):
    return _data_file(f'build/{name}.zip')


def rdf(name):
    return _data_file(f'rdf/{name}.ttl')


def graph(name):
    g = rdflib.Graph()
    with open(rdf(name), 'r') as f:
        g.parse(data=f.read(), format='turtle')
    return g
