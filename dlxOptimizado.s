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
   lf f2,a2			   ; Carga de a2 en f2
   lf f3,a4			   ; Carga de a4 en f3
   
   eqf f2,f0		   ; Comprobación del denominador 
   bfpt	fin			; Si es verdadero termina
   divf f7,f3,f2	   ; f -> Variable imagen cuentas
   multf f5,f2,f3	   ; y -> Variable imagen cuentas
   lf f4,a3			   ; Carga de a3 en f4
   lf f1,a1			   ; Carga de a1 en f1
   ;REVISAR OPTIM. multf f6 y subf
   multf f6,f2,f4	   ; z -> Variable imagen cuentas
   addf f29,f1,f3	   ; a1 + a4
   multf f4,f1,f4    ; x -> Variable imagen cuentas
  
   eqf f3,f0	      ; Comprobación del denominador 
   bfpt	fin	      ; Si es verdadero termina
   divf f13,f4,f3    ; ab34
   multf f30,f2,f6	; a2·z
   multf f17,f4,f7   ; ab24
   subf f31,f30,f2   ; (a2·z) - a2
   multf f18,f4,f2   ; ab33
   multf f20,f6,f3   ; ab42

   ;REVISAR OPTIM. subf f31 y eqf
   eqf f31,f0        ; Comprobación del denominador 
   bfpt	fin         ; Si es verdadero termina
   divf f8,f29,f31   ; Resultado determinante
   multf f21,f1,f5   ; ab43
   multf f14,f1,f3   ; ab21
   multf f15,f4,f3   ; ab22
   multf f16,f1,f7   ; ab23

   divf f10,f4,f2    ; ab13
   multf f22,f4,f5   ; ab44
   multf f19,f2,f13  ; ab34 Dependencia
   multf f23,f4,f8   ; M11
   multf f14,f14,f8  ; M21
   sf M+0,f23		
   
   eqf f5,f0	      ; Comprobación del denominador 
   bfpt	fin		   ; Si es verdadero termina
   divf f11,f4,f5    ; ab14
   ;f9 es f13
   multf f10,f10,f8  ; M13
   sf M+16,f14
   multf f15,f15,f8  ; M22
   sf M+8,f10
   multf f16,f16,f8  ; M23
   sf M+20,f15 
   multf f17,f17,f8  ; M24
   sf M+24,f16

   divf f12,f6,f3    ; ab32
   multf f9,f13,f8    ; M12
   sf M+28,f17
   multf f24,f6,f8   ; M31
   sf M+4,f9
   multf f18,f18,f8  ; M33
   sf M+32,f24
   multf f19,f19,f8  ; M34
   sf M+40,f18
   
   multf f11,f11,f8  ; M14
   sf M+44,f19
   multf f25,f5,f8   ; M41
   sf M+12,f11
   multf f20,f20,f8  ; M42
   sf M+48,f25
   multf f21,f21,f8  ; M43
   sf M+52,f20
   multf f22,f22,f8  ; M44
   sf M+56,f21
   multf f12,f12,f8  ; M32
   sf M+60,f22

   ;VECTORES FINALES
   multf f1,f23,f14  ; VM11
   sf M+36,f12
   
   multf f2,f9,f15   ; VM12
   sf VM+0,f1  

   multf f3,f10,f16  ; VM13
   addf f26,f1,f2    ; suma check
   sf VM+4,f2

   multf f4,f11,f17  ; VM14
   addf f26,f3,f26   ; suma check
   sf VM+8,f3

   multf f5,f24,f25  ; HM11
   addf f26,f4,f26   ; suma check
   sf VM+12,f4

   multf f6,f12,f20  ; HM12
   addf f26,f5,f26   ; suma check
   sf HM+0,f5
   
   multf f7,f18,f21  ; HM13
   addf f26,f6,f26   ; suma check
   sf HM+4,f6
   
   multf f8,f19,f22  ; HM14
   addf f26,f7,f26   ; suma check
   sf HM+8,f7
   

   ;REVISAR OPTIM. multf f8 y addf
   addf f26,f8,f26   ; suma check
   sf HM+12,f8
   
   sf check,f26

fin:
   trap 0
