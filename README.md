


##Ver FECHA dentro del script
```
obtenerDatos.sh
```

##Ejecutar analisis para todos los datos. Ver FECHA dentro del script
```
bash runAnalizador.sh | tee datos/datos.$(date +"%Y%m%d").csv
```

##Ejecutar manualmente para una empresa:
```
cd datos
python ../analizador.py M.ACS.xml 8 11 2007 26.4
```
