import xml.etree.ElementTree
import sys

if len(sys.argv) != 6:
    print("Uso: python analizar.py xml_file dia mes ano valor_actual")
    print("Ejemplo: python analizar M.ACS.xml 8 11 2007 25.6")
    print("Ejemplo: python analizar M.ACS.xml 0 0 0 25.6")
    exit(1)

media_acumulada = 0
maximo = 0
maximo_fecha = "00/00/0000"
minimo = 99999
minimo_fecha = "00/00/0000"
contador = 0
valor_actual = float(sys.argv[5])
desde_ano = int(sys.argv[4])
desde_mes = int(sys.argv[3])
desde_dia = int(sys.argv[2])
empresa = sys.argv[1][0:-4]

e = xml.etree.ElementTree.parse(sys.argv[1]).getroot()
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
    media_acumulada = media_acumulada + valor
    contador = contador + 1
    if valor > maximo:
        maximo = valor
        maximo_fecha = '{}/{}/{}'.format(dia, mes, ano)
    if valor < minimo:
        minimo = valor
        minimo_fecha = '{}/{}/{}'.format(dia, mes, ano)

#print("Minimo({}): {}".format(minimo_fecha,minimo))
#print("Maximo({}): {}".format(maximo_fecha,maximo))
#print("Media: " + str(media/contador))

media = media_acumulada/contador
valoracion_por_media=int(valor_actual*100/media)
valoracion_por_maxmin=int((valor_actual-minimo)*100/(maximo-minimo))

print("{},{},{},{},{},{},{}".format(round(media,3),round(minimo,3),round(maximo,3),valoracion_por_media,valoracion_por_maxmin,minimo_fecha,maximo_fecha))
