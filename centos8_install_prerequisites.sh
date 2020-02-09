#!/bin/bash

yum install -y git which clang make autoconf automake libtool python3 bzip2

yum install -y https://extras.getpagespeed.com/redhat/8/x86_64/RPMS/libunwind-1.3.1-2.el8.x86_64.rpm
yum install -y https://extras.getpagespeed.com/redhat/8/x86_64/RPMS/libunwind-devel-1.3.1-2.el8.x86_64.rpm
yum install -y libicu-devel.x86_64
yum install -y pcre-devel.x86_64

