# Mapa interactivo de los municipios que forman parte de las Zonas de Transición Justa

## **Mapa interactivo:** https://6o1ix4-ricardo-souto.shinyapps.io/Mapa_TJ/

## Sobre este proyecto

Este repositorio presenta un mapa interactivo que permite visualizar de forma geográfica los municipios incluidos en las distintos Zonas de Transición Justa en España.

## Objetivo del proyecto

Facilitar la comprensión territorial de los ZTJ.

## ¿Qué son las zonas de Transición Justa?

Las Zonas de Transición Justa (CTJ) son instrumentos de política pública impulsados por el Gobierno de España para acompañar a los territorios más afectados por el cierre de actividades intensivas en carbono, principalmente centrales térmicas de carbón, explotaciones mineras y otras industrias altamente contaminantes.

Su objetivo central es garantizar que la transición hacia un modelo económico descarbonizado sea socialmente equitativa, evitando que determinados territorios y colectivos queden rezagados como consecuencia del cambio de modelo productivo.

Además de una política ambiental, es una estrategia de desarrollo territorial, con impacto económico, social y laboral.

## ¿Qué municipios están incluidos?

Cada Zona de Transición Justa delimita un ámbito territorial concreto, compuesto por municipios que:

* Han dependido directa o indirectamente de actividades como la minería del carbón o la generación eléctrica térmica.

* Presentan una elevada exposición al impacto laboral y económico del cierre de estas instalaciones.

* Requieren medidas específicas de acompañamiento para reconvertir su estructura productiva.

La selección de municipios no es arbitraria responde a criterios técnicos, socioeconómicos y territoriales, definidos por el Ministerio para la Transición Ecológica y el Reto Demográfico (MITECO).

## Fuentes de datos:

Para llevar a cabo este proyecto se ha utilizado la página web del Instituto para la Transición Justa (ITJ), de donde se han obtenido tanto los municipios, las provincias y las comunidades como las Zonas de Transición Justa a las que pertenecen: https://www.transicionjusta.gob.es/es/municipios-ztj.html

Los datos de cada territorio se han obtenido a través de la página web del Instituto Nacional de Estadística (INE): https://www.ine.es/dyngs/INEbase/categoria.htm?c=Estadistica_P&cid=1254734710984

Por otra parte, los datos relativos a la las coordenadas geográficas se obtuvieron mediante geocodificación de los municipios utilizando la librería tidygeocoder de R, empleando el servicio OpenStreetMap.




