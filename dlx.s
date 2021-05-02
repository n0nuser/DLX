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
    lf f1,a1
    lf f2,a2
    sf A,a1
    divf f3,a1,a2
    sf A+4,f3
    sf A+8,a2
    multf f4,a1,a2
    sf A+12,f4

    ;MF_A3_A4
    lf f1,a3
    lf f2,a4
    sf B,a3
    divf f3,a3,a4
    sf B+4,f3
    sf B+8,a4
    multf f4,a3,a4
    sf B+12,f4

    
    ;AxB
    ;11 -> 0
    ;12 -> 4
    ;21 -> 8
    ;22 -> 12
    multf f1,A+0,B+0 ;; a11b11
    multf f2,A+0,B+4 ;; a11b12
    multf f3,A+4,B+0 ;; a12b11
    multf f4,A+4,B+4 ;; a12b12
    multf f5,A+0,B+8 ;; a11b21
    multf f6,A+0,B+12 ;; a11b22
    multf f7,A+4,B+8 ;; a12b21
    multf f8,A+4,B+12 ;; a12b22
    multf f9,A+8,B+0 ;; a21b11
    multf f10,A+8,B+4 ;; a21b12
    multf f11,A+12,B+0 ;; a22b11
    multf f12,A+12,B+4 ;; a22b12
    multf f13,A+8,B+8 ;; a21b21
    multf f14,A+8,B+12 ;; a21b22
    multf f15,A+12,B+8 ;; a22b21
    multf f16,A+12,B+12 ;; a22b22
    sf AB+0,f1
    sf AB+4,f2
    sf AB+8,f3
    sf AB+12,f4
    sf AB+16,f5
    sf AB+20,f6
    sf AB+24,f7
    sf AB+28,f8
    sf AB+32,f9
    sf AB+36,f10
    sf AB+40,f11
    sf AB+44,f12
    sf AB+48,f13
    sf AB+52,f14
    sf AB+56,f15
    sf AB+60,f16
    
	trap 0 ; Finaliza la ejecucion
