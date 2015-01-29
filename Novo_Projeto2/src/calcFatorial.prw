user function calcFatorial()
local n
local lDobra := .f.

msgalert("Calculo de Fatoriais")
resultado := "Numero = Fatorial" + chr(13)

for n := 1 to 5 step 2
	calcula(n, lDobra)
	lDobra := !lDobra
next

msgAlert(resultado)

return

static function calcula(anNumber, lDobra)
local x := anNumber
local total := 1

if lDobra
	x := x * 2
endif

while (x > 1)
	total := total * x
	x--
end

resultado += str(anNumber,3) + " é "
resultado += transform(total, "@E 9,999,999,999")
resultado += chr(13)

return
