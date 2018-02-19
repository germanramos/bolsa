FECHA=20070101
DATE=$(date  +"%Y%m%d")

mkdir -p datos.${DATE}
ln -F -s datos.${DATE} datos
cd datos

echo "Getting IBEX 35..."
curl --silent http://www.expansion.com/mercados/cotizaciones/indices/ibex35_I.IB.html > ibex35_I.IB.html
LLAVE=`cat ibex35_I.IB.html | grep ">var llave" | cut -d '"' -f 2`
sleep 2

echo "LLAVE: $LLAVE"
echo "FECHA: $FECHA"

for i in M.ABE M.ANA M.ACX M.ACS M.AENA M.AMS M.MTS M.SAB M.BKIA M.BKT M.BBVA M.CABK M.CLNX M.COL M.DIA M.ENG M.ELE M.FER M.GAS M.GRF M.IAG M.IBE M.ITX NEIDR M.MAP M.TL5 M.MEL M.MRL M.REE M.REP M.SAN M.SGRE M.TRE M.TEF M.VIS; do
sleep 2
echo -n "Getting $i..."
curl "http://www.expansion.com/app/graficos/datosFlash.html?cod=${i}&configuracion=configuracion_fichas_cms&llave=${LLAVE}&fecha=${FECHA}" -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: es-ES,es;q=0.9,en;q=0.8,de;q=0.7' -H 'X-Requested-By: FusionCharts' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Accept: text/plain, */*' -H 'Cache-Control: no-cache' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT' --silent --compressed >$i.xml
echo $?
done
