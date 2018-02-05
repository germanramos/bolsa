
DIA=8
MES=11
ANO=2007

echo "Fecha minimo,Valor minimo,Fecha maximo,Valor maximo,Periodo Media"
for i in *.xml; do
	#cat ibex35_I.IB.html | sed -n '/M.DIA/{n;p;}' | head -n 1 | cut -d '>' -f 2 | cut -d '<' -f 1
	python analizador.py $i $DIA $MES $ANO
done


