#!/bin/bash
#
# Copyright (c) 2025, Sergio Arroutbi Braojos <sergio.arroutbi (at) urjc.es>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
DIR="${1}"
test -z "${DIR}" && DIR="fuentes"

for file in "${DIR}"/*.p; do
	echo '------------------------------'
	fuente="${file/${DIR}\//}"
        # shellcheck disable=SC2001
	alumno="$(echo "${fuente}" | sed -e s/\.p$//g)"
	pushd "${DIR}" || exit
	fpc -gl "${fuente}" && echo "Alumno:${alumno}:[OK]" || echo "Alumno:${alumno}:[FAIL]"
	popd || exit
	echo '------------------------------'
done
