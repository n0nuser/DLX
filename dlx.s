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

; Nuestras variables
A: .float 0.0, 0.0
   .float 0.0, 0.0

B: .float 0.0, 0.0
   .float 0.0, 0.0

C: .float 0.0, 0.0
   .float 0.0, 0.0

AB: .float 0.0, 0.0, 0.0, 0.0
    .float 0.0, 0.0, 0.0, 0.0
    .float 0.0, 0.0, 0.0, 0.0
    .float 0.0, 0.0, 0.0, 0.0
     
	.text
; Espacio de codigo
	.global main

main:
	;Aqui va el codigo
    
    ;MF_A1_A2
    lf  f1,a1
    lf  f2,a2
    sf  A,f1
    divf    f3,f1,f2
    sf  A+4,f3
    sf  A+8,f2
    multf   f4,f1,f2
    sf  A+12,f4

    ;MF_A3_A4
    lf  f1,a3
    lf  f2,a4
    sf  B,f1
    divf    f3,f1,f2
    sf  B+4,f3
    sf  B+8,f2
    multf   f4,f1,f2
    sf  B+12,f4

    
    ;AxB
    ;11 -> 0
    ;12 -> 4
    ;21 -> 8
    ;22 -> 12
    lf f1,A+0
    lf f2,B+0
    multf f3,f1,f2 ; a11b11
    sf AB+0,f3

    lf f1,A+0
    lf f2,B+4
    multf f3,f1,f2    ; a11b12
    sf AB+0,f3

    lf f1,A+4
    lf f2,B+0
    multf f3,f1,f2    ; a12b11
    sf AB+0,f3

    lf f1,A+4
    lf f2,B+4
    multf f3,f1,f2    ; a12b12
    sf AB+0,f3

    lf f1,A+0
    lf f2,B+8
    multf f3,f1,f2    ; a11b21
    sf AB+0,f3

    lf f1,A+0
    lf f2,B+12
    multf f3,f1,f2   ; a11b22
    sf AB+0,f3

    lf f1,A+4
    lf f2,B+8
    multf f3,f1,f2   ; a12b21
    sf AB+0,f3

    lf f1,A+4
    lf f2,B+12
    multf f3,f1,f2   ; a12b22
    sf AB+0,f3

    lf f1,A+8
    lf f2,B+0
    multf f3,f1,f2    ; a21b11
    sf AB+0,f3

    lf f1,A+8
    lf f2,B+4
    multf f3,f1,f2   ; a21b12
    sf AB+0,f3

    lf f1,A+12
    lf f2,B+0
    multf f3,f1,f2  ; a22b11
    sf AB+0,f3

    lf f1,A+12
    lf f2,B+4
    multf f3,f1,f2  ; a22b12
    sf AB+0,f3
    
    lf f1,A+8
    lf f2,B+8
    multf f3,f1,f2   ; a21b21
    sf AB+0,f3
    
    lf f1,A+8
    lf f2,B+12
    multf f3,f1,f2  ; a21b22
    sf AB+0,f3
    
    lf f1,A+12
    lf f2,B+8
    multf f3,f1,f2  ; a22b21
    sf AB+0,f3
    
    lf f1,A+12
    lf f2,B+12
    multf f3,f1,f2 ; a22b22
    sf AB+0,f3

    ; Suma de a3 y a4
    addf    f31,a1,a4 ; En F31 queda la suma de A1 + A4
    
    ;MF_A2_A3
    lf  f1,a2
    lf  f2,a3
    sf  C,f1
    divf    f3,f1,f2
    sf  C+4,f3
    sf  C+8,f2
    multf   f4,f1,f2
    sf  C+12,f4

    multf   f5,f1,f4
    multf   f6,f2,f3
    subf    f30,f5,f6

    divf    f29,f31,f30

    multf   M+0,AB+0,f29
    multf   M+4,AB+,f29
    multf   M+8,AB+8,f29
    multf   M+12,AB+12,f29
    multf   M+16,AB+15,f29
    multf   M+20,AB+20,f29
    multf   M+24,AB+24,f29
    multf   M+28,AB+28,f29
    multf   M+32,AB+32,f29
    multf   M+36,AB+36,f29
    multf   M+40,AB+40,f29
    multf   M+44,AB+44,f29
    multf   M+48,AB+48,f29
    multf   M+52,AB+52,f29
    multf   M+56,AB+56,f29
    multf   M+60,AB+60,f29

	trap 0 ; Finaliza la ejecucion