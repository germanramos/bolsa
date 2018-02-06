
DIA=8
MES=11
ANO=2007

echo "Empresa,Valor Actual,Fecha minimo,Valor minimo,Fecha maximo,Valor maximo,Periodo Media"
cd datos
for i in *.xml; do
	filename=$(basename "$i")
	export EMPRESA="${filename%.*}"
	echo -n "$EMPRESA,"
	echo -n "$(cat ibex35_I.IB.html | LC_ALL=C sed -n "/${EMPRESA}/{n;p;}" | head -n 1 | cut -d '>' -f 2 | cut -d '<' -f 1 | sed 's/,/\./' ),"
	python ../analizador.py $i $DIA $MES $ANO
done
