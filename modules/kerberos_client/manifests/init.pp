#  Licensed to the Apache Software Foundation (ASF) under one or more
#   contributor license agreements.  See the NOTICE file distributed with
#   this work for additional information regarding copyright ownership.
#   The ASF licenses this file to You under the Apache License, Version 2.0
#   (the "License"); you may not use this file except in compliance with
#   the License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

class kerberos_client {
  require ntp

  if ($operatingsystem == "centos" and $operatingsystemmajrelease == "6") {
      package { 'krb5-auth-dialog':
        ensure => installed,
        before => File['/etc/krb5.conf'],
      }
  }
  case $operatingsystem {
    'centos': {
      package { 'krb5-workstation':
        ensure => installed,
        before => File['/etc/krb5.conf'],
      }
      package { 'krb5-libs':
        ensure => installed,
        before => File['/etc/krb5.conf'],
      }
    }
    'ubuntu': {
      package { 'krb5-user':
        ensure => installed,
        before => File['/etc/krb5.conf'],
      }
      package { 'krb5-config':
        ensure => installed,
        before => File['/etc/krb5.conf'],
      }
    }
  }

  file { '/etc/krb5.conf':
    ensure => file,
    content => template('kerberos_client/krb5.erb'),
  }
}
