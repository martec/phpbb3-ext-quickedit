#!/bin/bash
#
# This file is part of the Quickedit package.
#
# @copyright (c) 2014 Marc Alexander ( www.m-a-styles.de )
# @license http://opensource.org/licenses/gpl-2.0.php GNU General Public License v2
#
set -e
set -x

DB=$1
TRAVIS_PHP_VERSION=$2

if [ "$TRAVIS_PHP_VERSION" == "5.5" -a "$DB" == "mysqli" ]
then
	sed -n '1h;1!H;${;g;s/<\/php>/<\/php>\n\t<filter>\n\t\t<whitelist>\n\t\t\t<directory>..\/<\/directory>\n\t\t\t<exclude>\n\t\t\t\t<directory>..\/tests\/<\/directory>\n\t\t\t\t<directory>..\/develop\/<\/directory>\n\t\t\t\t<directory>..\/language\/<\/directory>\n\t\t\t\t<directory>..\/vendor\/<\/directory>\n\t\t\t\t<directory>..\/migrations\/<\/directory>\n\t\t\t<\/exclude>\n\t\t<\/whitelist>\n\t<\/filter>/g;p;}' phpBB/ext/marc/quickedit/travis/phpunit-mysqli-travis.xml &> phpBB/ext/marc/quickedit/travis/phpunit-mysqli-travis.xml.bak
	cp phpBB/ext/marc/quickedit/travis/phpunit-mysqli-travis.xml.bak phpBB/ext/marc/quickedit/travis/phpunit-mysqli-travis.xml
fi
