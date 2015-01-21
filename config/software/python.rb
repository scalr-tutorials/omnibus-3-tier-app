#
# Copyright 2013-2014 Chef Software, Inc.
# Copyright 2015 Scalr, Inc.
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
#

name 'python'
default_version '2.7.5'

dependency "gdbm"
dependency "ncurses"
dependency "zlib"
dependency "openssl"
dependency "bzip2"


source url: "https://www.python.org/ftp/python/#{version}/Python-#{version}.tgz"

version '2.7.5' do
  source md5: 'b4f01a1d0ba0b46b05c73b2ac909b1df'
end

relative_path "Python-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  env['CFLAGS'] = "-I#{install_dir}/embedded/include -O3 -g -pipe"

  command "./configure" \
          " --prefix=#{install_dir}/embedded" \
          ' --enable-shared' \
          ' --without-expat' \
          ' --without-ffi' \
          ' --without-sqlite' \
          ' --with-dbmliborder=gdbm', env: env

  make env: env
  make 'install', env: env

  # There exists no configure flag to tell Python to not compile readline
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/readline.*"

  # Remove unused extension which is known to make healthchecks fail on CentOS 6
  delete "#{install_dir}/embedded/lib/python2.7/lib-dynload/_bsddb.*"
end
