import xml.etree.ElementTree
import sys

e = xml.etree.ElementTree.parse('IBEX-19990101-20180125.xml').getroot()

media = 0
maximo = 0
maximo_fecha = "00/00/0000"
minimo = 99999
minimo_fecha = "00/00/0000"
contador = 0
desde_ano = 0
desde_mes = 0
desde_dia = 0

if len(sys.argv) == 4:
    print("Desde: ", sys.argv)
    desde_ano = int(sys.argv[3])
    desde_mes = int(sys.argv[2])
    desde_dia = int(sys.argv[1])

for atype in e.find('dataset').findall('set'):
    dia = int(atype.attrib.get("toolText")[1:3])
    mes = int(atype.attrib.get("toolText")[4:6])
    ano = int(atype.attrib.get("toolText")[7:11])

    if ano < desde_ano:
        continue
    elif ano == desde_ano and mes < desde_mes:
        continue
    elif ano == desde_ano and mes == desde_mes and dia < desde_dia:
        continue

    valor = float(atype.attrib.get("value"))
    #print(dia, mes, ano, valor)
    media = media + valor
    contador = contador + 1
    if valor > maximo:
        maximo = valor
        maximo_fecha = '{}/{}/{}'.format(dia, mes, ano)
    if valor < minimo:
        minimo = valor
        minimo_fecha = '{}/{}/{}'.format(dia, mes, ano)
print("Minimo({}): {}".format(minimo_fecha,minimo))
print("Maximo({}): {}".format(maximo_fecha,maximo))
print("Media: " + str(media/contador))
