LLAVE=MTY4NjIwNjo6aHR0cDovL3d3dy5leHBhbnNpb24uY29tL2JvbHNhL3BhZ2luYXNmaWNoYXMvZmljaGFWYWxvcmVzLmh0bWw9PWQxNTBkMzI0NzMwY2VhZDk0ZjkyZDVmODM5Yzg1ZWMz
FECHA=20180101

EMPRESA=ELE
curl "http://www.expansion.com/app/graficos/datosFlash.html?cod=M.${EMPRESA}&configuracion=configuracion_fichas_cms&llave=${LLAVE}&fecha=${FECHA}" -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: es-ES,es;q=0.9,en;q=0.8,de;q=0.7' -H 'X-Requested-By: FusionCharts' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Accept: text/plain, */*' -H 'Cache-Control: no-cache' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT' --compressed
