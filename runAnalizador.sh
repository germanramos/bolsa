
DIA=8
MES=11
ANO=2007

echo "Empresa,Actual,Media,Minimo,Maximo,Val por media,Val por maxmin,Fecha minimo,Fecha maximo"
cd datos
for i in *.xml; do
	filename=$(basename "$i")
	EMPRESA="${filename%.*}"
	VALOR=$(cat ibex35_I.IB.html | LC_ALL=C sed -n "/${EMPRESA}/{n;p;}" | head -n 1 | cut -d '>' -f 2 | cut -d '<' -f 1 | sed 's/,/\./' )
	echo -n "$EMPRESA,$VALOR,"
	python ../analizador.py $i $DIA $MES $ANO $VALOR
done
