; Programa Plantilla

.data
; Espacio de datos

; VARIABLES DE ENTRADA: NO MODIFICAR ORDEN (Se pueden modificar los valores)
a1: .float 1.1
a2: .float 2.2
a3: .float 3.3
a4: .float 4.4
; VARIABLES DE SALIDA: NO MODIFICAR ORDEN
; m11, A, m13, m14
; m21, m22, m23, m24
; m31, m32, m33, B
; m41, m42, m43, m44
M: .float 0.0, 0.0, 0.0, 0.0
   .float 0.0, 0.0, 0.0, 0.0
   .float 0.0, 0.0, 0.0, 0.0
   .float 0.0, 0.0, 0.0, 0.0
; hm1, hm2, hm3, hm4
HM: .float 0.0, 0.0, 0.0, 0.0
; vm1, vm2, vm3, vm4
VM: .float 0.0, 0.0, 0.0, 0.0
check: .float 0.0
; FIN NO MODIFICAR ORDEN
 
	.text
; Espacio de codigo
	.global main

main:
   ;MF_A1_A2
   lf  f1,a1 ;  Carga de a1 en f1
   lf  f2,a2 ;  Carga de a2 en f2
   divf    f5,f1,f2
   multf   f6,f1,f2

   ;MF_A3_A4
   lf  f3,a3 ; Carga a3 en f3
   lf  f4,a4 ; Carga a4 en f4
   
   eqf f4,f0		   ; Comprobación del denominador 
   bfpt	fin			; Si es verdadero termina
   divf    f7,f3,f4
   multf   f8,f3,f4

   ; f1 = a1 y A+0
   ; f2 = a2 y A+8
   ; f3 = a3 y B+0
   ; f4 = a4 y B+8
   ; f5 = A+4
   ; f6 = A+12
   ; f7 = B+4
   ; f8 = B+12

   ;;;;;;;;;;;;;;;;;;;;;;;;;
   ; f1 = A+0
   ; f5 = A+4
   ; f2 = A+8
   ; f6 = A+12
   ; f3 = B+0
   ; f7 = B+4
   ; f4 = B+8
   ; f8 = B+12

   ;AxB
   ;11 -> 0
   ;12 -> 4
   ;21 -> 8
   ;22 -> 12
   multf f9,f1,f3    ; a11b11
   multf f10,f1,f7   ; a11b12
   multf f11,f5,f3   ; a12b11
   multf f12,f5,f7   ; a12b12
   multf f13,f1,f4   ; a11b21
   multf f14,f1,f8   ; a11b22
   multf f15,f5,f4   ; a12b21
   multf f16,f5,f8   ; a12b22
   multf f17,f2,f3   ; a21b11
   multf f18,f2,f7   ; a21b12
   multf f19,f6,f3   ; a22b11
   multf f20,f6,f7   ; a22b12
   multf f21,f2,f4   ; a21b21
   multf f22,f2,f8   ; a21b22
   multf f23,f6,f4   ; a22b21
   multf f24,f6,f8   ; a22b22
   ;;;;;;;;;;;;;;;;;;;;;;;;;

   addf    f31,f1,f4 ; En F31 queda la suma de A1 + A4
   
   ;MF_A2_A3
   eqf f3,f0		   ; Comprobación del denominador 
   bfpt	fin			; Si es verdadero termina
   divf    f25,f2,f3
   multf   f26,f2,f3
   
   ;DETERMINANTE
   multf   f27,f2,f26   ; Diagonal primera
   multf   f28,f25,f3   ; Diagonal segunda
   subf    f30,f27,f28  ; Resta
   eqf f30,f0		      ; Comprobación del denominador 
   bfpt	fin			   ; Si es verdadero termina
   divf    f29,f31,f30  ; Resultado parte derecha operacion queda en F29

   ; MULTIPLICACIÓN DE MATRIZ POR UN NÚMERO
   ; AB+0  -> f9
   ; AB+4  -> f10
   ; AB+8  -> f11
   ; AB+12 -> f12
   ; AB+16 -> f13
   ; AB+20 -> f14
   ; AB+24 -> f15
   ; AB+28 -> f16
   ; AB+32 -> f17
   ; AB+36 -> f18
   ; AB+40 -> f19
   ; AB+44 -> f20
   ; AB+48 -> f21
   ; AB+52 -> f22
   ; AB+56 -> f23
   ; AB+60 -> f24

   ; se guardan desde el f5 a f8, f27 y 28, 30 y 31 para mejorar el rendimiento (en comparación con guardarlo en f6)
   ; f9 al 24 restringidos por datos de AB
   ; f29 es el resultado de la parte derecha de la cuenta
   ; Toda esta sección son las cuentas de M y cómo se guardan
   multf   f27,f9,f29
   sf M+0,f27
   multf   f28,f10,f29
   sf M+4,f28
   multf   f30,f11,f29
   sf M+8,f30
   multf   f31,f12,f29
   sf M+12,f31
   multf   f27,f13,f29
   sf M+16,f27
   multf   f28,f14,f29
   sf M+20,f28
   multf   f30,f15,f29
   sf M+24,f30
   multf   f31,f16,f29
   sf M+28,f31
   multf   f27,f17,f29
   sf M+32,f27
   multf   f28,f18,f29
   sf M+36,f28
   multf   f30,f19,f29
   sf M+40,f30
   multf   f31,f20,f29
   sf M+44,f31
   multf   f27,f21,f29
   sf M+48,f27
   multf   f28,f22,f29
   sf M+52,f28
   multf   f30,f23,f29
   sf M+56,f30
   multf   f31,f24,f29
   sf M+60,f31

   ;VM
   lf f5,M+0
   lf f6,M+16
   multf f7,f5,f6
   sf VM+0,f7   

   lf f5,M+4
   lf f6,M+20
   multf f8,f5,f6
   sf VM+4,f8

   lf f5,M+8
   lf f6,M+24
   multf f9,f5,f6
   sf VM+8,f9

   lf f5,M+12
   lf f6,M+28
   multf f10,f5,f6
   sf VM+12,f10

   ;HM
   lf f5,M+32
   lf f6,M+48
   multf f11,f5,f6
   sf HM+0,f11

   lf f5,M+36
   lf f6,M+52
   multf f12,f5,f6
   sf HM+4,f12

   lf f5,M+40
   lf f6,M+56
   multf f13,f5,f6
   sf HM+8,f13

   lf f5,M+44
   lf f6,M+60
   multf f14,f5,f6
   sf HM+12,f14

   ;check
   addf f5,f7,f8
   addf f5,f9,f5
   addf f5,f10,f5
   addf f5,f11,f5
   addf f5,f12,f5
   addf f5,f13,f5
   addf f5,f14,f5
   sf check,f5

fin:
	trap 0 ; Finaliza la ejecucion
