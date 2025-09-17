
# Información mínima:

## tsa

El "Sellado de tiempo confiable" es el proceso que garantiza las
fechas de creación y/o modificación de ficheros electrónicos
(ej. contratos, información de investigación, registros médicos,
contenido web, etc). Es usado para demostrar la existencia de alguna
información antes de una determinada fecha, imposibilitando que el
dueño de dicha información pueda modificarla sin comprometer a su vez
el sello de tiempo aplicado.

Para los casos de los archivos que no son pdf en este índice se ha
usado los sellados de fretsa.org.

Con openssl se puede verificar el sello de tiempo (también se puede
hacer online desde la web).

Por ejemplo:

```bash openssl ts -verify -in 0816_eml.tsr -queryfile
0816_eml.tsq -CAfile cacert.pem
```

## blockchains

Otra forma es la que aparece reflejada en los pdfs: incluir un hash de
las filas en los blockchains. Cualquiera sirve. He usado bitcoin y
ethereum.


