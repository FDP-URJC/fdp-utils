#!/bin/bash -e
PROGRAM="${1}"
DATOS="${2}"
test -z "${PROGRAM}" && PROGRAM="bingo"
test -z "${DATOS}" && DATOS="datos.txt"
echo "-------------------------------------------------------------------"
echo "Básico (Gana Jugador 1):"
echo "-------------------------------------------------------------------"
cat << EOF > "${DATOS}"
rojo 10 12 14 16 18
verde 14 15 16 17 18
amarillo 15 16 17 18 20
FIN
rojo 11 13 15 17 19
verde 14 15 16 17 18
amarillo 15 16 17 18 19
FIN
rojo 34 33 32 31 30
amarillo 34 33 32 31 30
azul 34 33 32 31 30
FIN
rojo 11
rojo 13
rojo 15
rojo 17
rojo 19
rojo 10
rojo 12
	rojo 14 rojo 16

rojo 18
verde 14
verde 15
verde 16
verde 17          verde 18
amarillo 15
amarillo 16
amarillo 17          amarillo 18
amarillo 19
azul 34
azul 33
azul 32
amarillo 20
EOF
./"${PROGRAM}" "${DATOS}"
