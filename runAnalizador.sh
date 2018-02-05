
DIA=8
MES=11
ANO=2007

echo "Fecha minimo,Valor minimo,Fecha maximo,Valor maximo,Periodo Media"
for i in *.xml; do
	python analizador.py $i $DIA $MES $ANO
done


