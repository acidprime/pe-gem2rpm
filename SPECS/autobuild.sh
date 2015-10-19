#/bin/bash

# Usage: ./auobuild.sh <packagename>
# eg: ./autobuild.sh hiera-gpg

PACKAGE=$1

cd ../SOURCES
/opt/puppetlabs/server/data/puppetserver/jruby-gems/bin/gem2rpm --fetch $PACKAGE

SOURCE=`ls ${PACKAGE}-* | tail -1`

cd ../SPECS
/opt/puppetlabs/server/data/puppetserver/jruby-gems/bin/gem2rpm --no-doc -t pe-template.spec ../SOURCES/${SOURCE} > ${PACKAGE}.spec
rpmbuild -bb ${PACKAGE}.spec

