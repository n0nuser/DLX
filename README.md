# Práctica DLX

Fecha de entrega 21 de Mayo de 2021

## Integrantes

* [Sergio García González](https://github.com/AnOrdinaryUsser)
* Pablo Jesús González Rubio

## Nota Final:

## Enunciado

Es [este documento](docs/Enunciado.pdf).

## Resolución

Estadísticas del código sin optimizar, haciendo las operaciones sin importar mucho el uso de registros y orden de las instrucciones. Se consiguen **351 ciclos**.

![Estadísticas sin optimizar](img/statsNoOpti.png)

Haciendo las siguientes cuentas, haciendo factor común a las multiplicaciones, conseguimos reducir enormemente la cantidad de ciclos pues las divisiones y las multiplicaciones se hacen en paralelo.

![Cuentas](img/cuentas.png)

Y por último reordenamos algunas instrucciones que tenían dependencias y conseguimos bajar a **203 ciclos**.

![Estadísticas optimizadas](img/statsOpti.png)

Por lo tanto, **hemos conseguido reducir 148 ciclos**.

Para una explicación más detallada, tenemos el [informe final](docs/InformeFinal.pdf) que entregamos.

## Documentos adicionales

* [Resumen Instrucciones DLX](docs/ResumenInstruccionesDLX.pdf)
