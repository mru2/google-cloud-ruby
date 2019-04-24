# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""This script is used to synthesize generated parts of this library."""

import synthtool as s
import synthtool.gcp as gcp
import synthtool.languages.ruby as ruby
import logging
import os
import re
import subprocess


logging.basicConfig(level=logging.DEBUG)

gapic = gcp.GAPICGenerator()

v1_library = gapic.ruby_library(
    'securitycenter', 'v1',
    artman_output_name='google-cloud-ruby/google-cloud-securitycenter'
)
for path in (v1_library / 'lib/google/cloud/securitycenter/v1').glob('*.rb'):
    os.rename(
        v1_library / 'lib/google/cloud/securitycenter/v1' / path.name,
        v1_library / 'lib/google/cloud/security_center/v1' / path.name
    )
s.copy(v1_library / 'lib/google/cloud/security_center/v1')
s.copy(v1_library / 'lib/google/cloud/security_center/v1.rb')
s.copy(v1_library / 'lib/google/cloud/security_center.rb')
s.copy(v1_library / 'test/google/cloud/security_center/v1')
s.copy(v1_library / 'README.md')
s.copy(v1_library / 'LICENSE')
s.copy(v1_library / '.gitignore')
s.copy(v1_library / '.yardopts')
s.copy(v1_library / 'google-cloud-security_center.gemspec', merge=ruby.merge_gemspec)

# Permanent: rename securitycenter file paths to security_center
s.replace(
    [
        'lib/google/cloud/security_center/**/*.rb',
        'test/**/*.rb'
    ],
    'google/cloud/securitycenter/v1',
    'google/cloud/security_center/v1'
)
s.replace(
    [
        'lib/google/cloud/security_center/**/*.rb',
        'test/**/*.rb'
    ],
    'Google::Cloud::Securitycenter',
    'Google::Cloud::SecurityCenter'
)

# https://github.com/googleapis/gapic-generator/issues/2196
s.replace(
    [
      'README.md',
      'lib/google/cloud/security_center.rb',
      'lib/google/cloud/security_center/v1.rb'
    ],
    '\\[Product Documentation\\]: https://cloud\\.google\\.com/securitycenter\n',
    '[Product Documentation]: https://cloud.google.com/security-command-center/\n')

# https://github.com/googleapis/gapic-generator/issues/2243
s.replace(
    'lib/google/cloud/security_center/*/*_client.rb',
    '(\n\\s+class \\w+Client\n)(\\s+)(attr_reader :\\w+_stub)',
    '\\1\\2# @private\n\\2\\3')

# https://github.com/googleapis/gapic-generator/issues/2279
s.replace(
    'lib/**/*.rb',
    '\\A(((#[^\n]*)?\n)*# (Copyright \\d+|Generated by the protocol buffer compiler)[^\n]+\n(#[^\n]*\n)*\n)([^\n])',
    '\\1\n\\6')

# https://github.com/googleapis/gapic-generator/issues/2323
s.replace(
    [
        'lib/**/*.rb',
        'README.md'
    ],
    'https://github\\.com/GoogleCloudPlatform/google-cloud-ruby',
    'https://github.com/googleapis/google-cloud-ruby'
)
s.replace(
    [
        'lib/**/*.rb',
        'README.md'
    ],
    'https://googlecloudplatform\\.github\\.io/google-cloud-ruby',
    'https://googleapis.github.io/google-cloud-ruby'
)

# https://github.com/googleapis/gapic-generator/issues/2393
s.replace(
    'google-cloud-security_center.gemspec',
    'gem.add_development_dependency "rubocop".*$',
    'gem.add_development_dependency "rubocop", "~> 0.64.0"'
)

s.replace(
    'lib/**/credentials.rb',
    'SECURITYCENTER_',
    'SECURITY_CENTER_'
)

# Require the helpers file
s.replace(
    f'lib/google/cloud/security_center/v1.rb',
    f'require "google/cloud/security_center/v1/security_center_client"',
    '\n'.join([
        f'require "google/cloud/security_center/v1/security_center_client"',
        f'require "google/cloud/security_center/v1/helpers"'
    ])
)

# Generate the helper methods
subprocess.call('bundle update && bundle exec rake generate_partials', shell=True)
