# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Generates a table of contents for Markdown files inside for a git-based repository"
HOMEPAGE="https://github.com/thlorenz/doctoc"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

LICENSE="MIT"
SLOT="0"
RESTRICT="network-sandbox"

BDEPEND="net-libs/nodejs[npm]"

src_install(){
	npm install -g --prefix="${ED}/usr" ${PN} || die "Installation failed"
}
